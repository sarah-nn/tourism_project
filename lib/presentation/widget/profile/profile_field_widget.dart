import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_project/business_logic/country/country_cubit.dart';
import 'package:tourism_project/business_logic/profile/profile_cubit.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/data/models/country_model.dart';

class ProfileField extends StatefulWidget {
  final String title;
  final String userInfo;
  final bool index;
  final Function()? onTap;
  const ProfileField(
      {super.key,
      required this.title,
      required this.userInfo,
      required this.index,
      required this.onTap});

  @override
  State<ProfileField> createState() => _ProfileFieldState();
}

class _ProfileFieldState extends State<ProfileField> {
  List<CountryModel> countryList = [];
  bool enableEdit = false;
  String tapTitle = '';
  bool isFail = false;
  @override
  void initState() {
    super.initState();
    context.read<CountryCubit>().getAllCountrey();
  }

  @override
  Widget build(BuildContext context) {
    var myCubit = context.read<ProfileCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: const TextStyle(color: Colors.grey, fontSize: 18),
            ),
            widget.title != 'Email'
                ? BlocConsumer<CountryCubit, CountryState>(
                    listener: (context, state) {
                      if (state is CountrySuccess) {
                        countryList = (state).countryList;
                      }
                    },
                    builder: (context, state) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            tapTitle = widget.title;
                            enableEdit = true;
                          });
                          widget.title == 'Location'
                              ? showCountryList(countryList, myCubit)
                              : null;
                        },
                        child: Icon(
                          Icons.edit_rounded,
                          color: AppColor.primaryColor,
                        ),
                      );
                    },
                  )
                : Container()
          ],
        ),
        enableEdit && (widget.title == tapTitle && widget.title != 'Location')
            ? TextFormField(
                keyboardType: widget.title == 'Name'
                    ? TextInputType.text
                    : TextInputType.number,
                controller: widget.title == 'Name'
                    ? myCubit.nameController
                    : myCubit.phoneNumber,
                decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    suffixIcon: IconButton(
                        onPressed: () async {
                          setState(() {
                            enableEdit = false;
                          });

                          await myCubit.updateUserInfo();

                          setState(() {
                            myCubit.errMessage != ''
                                ? isFail = true
                                : isFail = false;

                            myCubit.errMessage == '';
                          });
                          // Clear the controller after usage
                          if (widget.title == 'Name') {
                            myCubit.nameController.clear();
                          } else {
                            myCubit.phoneNumber.clear();
                          }
                          print(myCubit.buildRequestBody());
                        },
                        icon: Icon(Icons.check))),
              )
            : Text(
                widget.userInfo,
                style: MyTextStyle.normal.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                    color: Color.fromARGB(136, 0, 0, 0)),
              ),
        isFail && (widget.title == tapTitle && widget.title != 'Location')
            ? Container(
                child: Text(
                  myCubit.errMessage,
                  style: const TextStyle(color: Color.fromRGBO(244, 67, 54, 1)),
                ),
              )
            : Container(),
        widget.index
            ? const Divider(
                height: 20,
                thickness: 2,
                color: Color.fromARGB(255, 216, 216, 216))
            : Container()
      ],
    );
  }

  showCountryList(List<CountryModel> name, ProfileCubit myCubit) {
    return showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return Dialog(
          backgroundColor: AppColor.secondColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey))),
                    child: Text(
                      "What is Your Country ? ",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Expanded(
                    flex: 18,
                    child: Container(
                      padding: EdgeInsets.only(top: 15),
                      height: double.maxFinite,
                      child: ListView.builder(
                        itemCount: name.length,
                        itemBuilder: (context, index) {
                          // final names =
                          //     activitiesList[index]['name'];
                          // final item =
                          //     activitiesList[index]['id'];
                          // final isSelected =
                          //     _selectedItems.contains(item);

                          return ListTile(
                            title: Text(name[index].name),
                            subtitle: const Divider(
                              color: Color.fromARGB(255, 182, 181, 181),
                            ),
                            onTap: () async {
                              context.pop();
                              setState(() {
                                print(name[index].id);
                                myCubit.userPosition =
                                    name[index].id.toString();
                              });
                              await myCubit.updateUserInfo();
                              print(myCubit.buildRequestBody());
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
