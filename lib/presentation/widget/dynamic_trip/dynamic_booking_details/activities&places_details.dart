import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_project/business_logic/activity/activity_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_routes.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/dynamic_booking_details_model.dart';

class ActivityAndPlaces extends StatefulWidget {
  const ActivityAndPlaces(
      {super.key, required this.mymodel, required this.isEdit});
  final DataModel? mymodel;
  final bool isEdit;

  @override
  State<ActivityAndPlaces> createState() => _ActivityAndPlacesState();
}

class _ActivityAndPlacesState extends State<ActivityAndPlaces> {
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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Column(
        children: [
          Container(
              width: double.maxFinite,
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const Text(
                          "Places    ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17.5),
                        ),
                        widget.isEdit
                            ? IconButton(
                                onPressed: () {
                                  GoRouter.of(context).push(AppRoutes.test2,
                                      extra: widget.mymodel!.dynamicTrip!
                                          .destinationTripId!
                                          .toString());
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  size: 20,
                                ))
                            : Container()
                      ],
                    ),
                  ),
                  Expanded(
                      child: widget.mymodel!.activities!.isNotEmpty
                          ? BlocConsumer<ActivityCubit, ActivityState>(
                              listener: (context, state) {
                                if (state is ActivitySuccess) {
                                  activitiesList = (state).activities;
                                }
                              },
                              builder: (context, state) {
                                return Row(
                                  children: [
                                    const Text(
                                      "Activites   ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17.5),
                                    ),
                                    widget.isEdit
                                        ? IconButton(
                                            onPressed: () {
                                              showModelButtomSheetCustom(
                                                  context, activitiesList);
                                            },
                                            icon: const Icon(
                                              Icons.edit,
                                              size: 20,
                                            ))
                                        : Container()
                                  ],
                                );
                              },
                            )
                          : Container())
                ],
              )),
          Container(
              alignment: Alignment.topCenter,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Container(
                          child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...List.generate(
                        widget.mymodel!.places!.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            "${index + 1}. ${widget.mymodel!.places![index].name!}",
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  ))),
                  Expanded(
                    child: Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...List.generate(
                          widget.mymodel!.activities!.length,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              "${index + 1}. ${widget.mymodel!.activities![index].name!}",
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    )),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
