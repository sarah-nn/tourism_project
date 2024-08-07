import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/activity/activity_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/core/utils/global.dart';

class ActivityDynamicWidget extends StatefulWidget {
  const ActivityDynamicWidget({super.key});

  @override
  State<ActivityDynamicWidget> createState() => _ActivityDynamicWidgetState();
}

class _ActivityDynamicWidgetState extends State<ActivityDynamicWidget> {
  final List<String> _items = List.generate(20, (index) => 'Item $index');
  final List<int> _selectedItems = activities;
  List<dynamic> activitiesList = [];
  bool isTapped = false;

  void initState() {
    super.initState();
    context.read<ActivityCubit>().getAllActivity();
  }

  void _onItemTapped(int item) {
    setState(() {
      if (_selectedItems.contains(item)) {
        _selectedItems.remove(item);
      } else {
        _selectedItems.add(item);
      }
    });
  }

  void showModelButtomSheetCustom(BuildContext context, activityList) {
    showDialog(
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
                      "${activitiesList.length}  Activities ",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Expanded(
                    flex: 18,
                    child: Container(
                      height: double.maxFinite,
                      child: ListView.builder(
                        itemCount: activitiesList.length,
                        itemBuilder: (context, index) {
                          final names = activitiesList[index]['name'];
                          final item = activitiesList[index]['id'];
                          final isSelected = _selectedItems.contains(item);

                          return ListTile(
                            title: Text(
                              names,
                              style: MyTextStyle.headers.copyWith(fontSize: 22),
                            ),
                            trailing: isSelected
                                ? const Icon(Icons.check_box,
                                    color: Colors.blue)
                                : const Icon(Icons.check_box_outline_blank),
                            onTap: () {
                              setState(() {
                                _onItemTapped(item);
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      child: Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: MaterialButton(
                          height: 30,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Done",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ActivityCubit, ActivityState>(
      listener: (context, state) {
        if (state is ActivitySuccess) {
          activitiesList = (state).activities;
        }
      },
      builder: (context, state) {
        return Container(
            child: !isTapped
                ? RichText(
                    text: TextSpan(
                      // text: "And  ",
                      style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 19.0,
                          fontWeight: FontWeight.w500,
                          height: 1.5),
                      children: <TextSpan>[
                        const TextSpan(
                            // text: "Finally ", style: MyTextStyle.bright
                            ),
                        const TextSpan(
                          text:
                              "You Can do many Activites in places of your Trip So ",
                        ),
                        TextSpan(
                            text: 'TAP',
                            style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                //  print(activitiesList.length);
                                setState(() {
                                  isTapped = true;
                                });
                                showModelButtomSheetCustom(
                                    context, activitiesList);
                              }),
                        const TextSpan(
                          text: ' Choose them',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: Column(
                      children: [
                        Text(
                          "${activities.length} Activities Selected ",
                          style: MyTextStyle.normal.copyWith(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: AppColor.secondColor,
                              border: Border.all(
                                  color:
                                      AppColor.primaryColor.withOpacity(0.3)),
                              borderRadius: BorderRadius.circular(15)),
                          child: MaterialButton(
                            elevation: 10,
                            onPressed: () {
                              showModelButtomSheetCustom(
                                  context, activitiesList);
                            },
                            child: const Text(
                              "Return to Choose",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));
      },
    );
  }
}
