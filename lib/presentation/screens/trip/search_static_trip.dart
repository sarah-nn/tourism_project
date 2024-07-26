import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tourism_project/business_logic/static_trip/static_trip_cubit.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/data/models/all_static_trip_model.dart';
import 'package:tourism_project/presentation/widget/static_trip/custom_search_widget.dart';
import 'package:tourism_project/presentation/widget/static_trip/trip_item_widget.dart';

class SearchStaticTripPage extends StatefulWidget {
  const SearchStaticTripPage({super.key});

  @override
  State<SearchStaticTripPage> createState() => _SearchStaticTripPageState();
}

class _SearchStaticTripPageState extends State<SearchStaticTripPage> {
  List<AllStaticTripModel> tripList = [];
  List<String> type = ['country', 'place', 'activity', 'date'];
  List<IconData> icons = [
    Icons.location_on_outlined,
    Iconsax.activity_copy,
    Icons.flag_outlined,
    Icons.date_range
  ];
  String typeVal = '';
  String errMessage = '';
  bool isChoose = false;
  bool isSearch = false;
  bool isDate = false;
  bool isEnterDate = false;
  bool isEmptyOrError = false;
  DateTimeRange? selectedDateRange;

  @override
  Widget build(BuildContext context) {
    var controller = context.read<StaticTripCubit>().searchController;
    return BlocConsumer<StaticTripCubit, StaticTripState>(
      listener: (context, state) {
        if (state is AllStaticTripSuccess) {
          tripList = (state).allTripList;
          print("================$tripList=======");
        } else if (state is StaticTripFail) {
          errMessage = (state).errMessage;
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                        alignment: Alignment.bottomCenter,
                        padding: const EdgeInsets.only(
                            left: 16, right: 12, bottom: 20),
                        height: 160,
                        decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25))),
                        child: !isDate
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Speicify Trip Search ",
                                    style: MyTextStyle.headers.copyWith(
                                        color: Colors.white, fontSize: 24),
                                  ),
                                  SizedBox(height: 8),
                                  isChoose
                                      ? CustomSearch(
                                          myController: controller,
                                          title: "Search Trip in $typeVal ..",
                                          onPressedIcon: () {
                                            setState(() {
                                              isSearch = true;
                                              (controller.text.isEmpty &&
                                                      tripList.isEmpty)
                                                  ? isEmptyOrError = true
                                                  : false;
                                            });
                                            print(typeVal);
                                            print(controller.text);
                                            context
                                                .read<StaticTripCubit>()
                                                .printll();
                                            context
                                                .read<StaticTripCubit>()
                                                .SearchTrip();
                                          })
                                      : customDateRang(false)
                                ],
                              )
                            : customDateRang(true)),
                  ),
                ],
              ),
              isSearch
                  ? Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      child: Text(
                          "${tripList.length} Result of Type $typeVal Search"))
                  : Container(
                      height: 50,
                    ),
              Expanded(
                child: Container(
                    alignment: Alignment.topCenter,
                    child: !isChoose
                        ? selectTypeContainer()
                        : isSearch
                            ? tripList.isNotEmpty
                                ? Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18),
                                    child: ListView.builder(
                                        itemCount: tripList.length,
                                        itemBuilder: (context, index) {
                                          var tripmodel = tripList[index];
                                          return StaticTripItem(
                                              isSearch: true,
                                              location: "location",
                                              price: "price",
                                              index: index,
                                              tripmodel: tripmodel);
                                        }))
                                : noSearchResult()
                            : Container()),
              )
            ],
          ),
        );
      },
    );
  }

  Widget selectTypeContainer() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: type.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  onTap: () {
                    print(type[index]);
                    setState(() {
                      context.read<StaticTripCubit>().type = type[index];
                      isChoose = true;
                      typeVal = type[index];
                      if (typeVal == 'date') {
                        isDate = true;
                        isChoose = true;
                      }
                    });
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: Container(
                        padding: EdgeInsets.only(left: 36),
                        height: 60,
                        decoration: BoxDecoration(
                            color: AppColor.secondColor,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all()),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              type[index],
                              style: MyTextStyle.poppins.copyWith(
                                  fontSize: 21, color: AppColor.primaryColor),
                            ),
                            Container(
                                width: 60,
                                height: double.maxFinite,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color: Colors.black54)),
                                child: Icon(
                                  icons[index],
                                  size: 33,
                                  color: AppColor.primaryColor,
                                ))
                          ],
                        )),
                  )),
            );
          }),
    );
  }

  Future<void> _selectDateRange() async {
    final ThemeData customTheme = ThemeData(
      primaryColor: AppColor.primaryColor,
      colorScheme: ColorScheme.light(
          primary: AppColor.primaryColor, background: AppColor.secondColor),
      textTheme: const TextTheme(
        bodyText2:
            TextStyle(fontSize: 20, fontFamily: 'Pacifico'), // Dates text
      ),
      dialogTheme: DialogTheme(
        elevation: 10,
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
      ),
    );
    DateTime now = DateTime.now();
    final DateTimeRange? pickedDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(now.year, now.month, now.day),
      lastDate: DateTime(2050),
      builder: (BuildContext context, Widget? child) {
        return Theme(data: customTheme, child: child!);
      },
    );

    if (pickedDateRange != null) {
      setState(() {
        context.read<StaticTripCubit>().firstDate =
            pickedDateRange.start.toString().split(' ')[0];
        context.read<StaticTripCubit>().secondDate =
            pickedDateRange.end.toString().split(' ')[0];
        isEnterDate = true;
        //  print("$startDate    $endDate");
      });
    }
  }

  Widget customDateRang(bool isDate) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              isDate ? _selectDateRange() : null;
            },
            child: Container(
              alignment: Alignment.center,
              height: 53,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 230, 230, 230),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: isEnterDate
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: showSelectedDateRange(),
                    )
                  : Text(
                      isDate ? "Tap to Choose Date Range" : "Select To Search",
                      style:
                          TextStyle(fontSize: 18, color: AppColor.primaryColor),
                    ),
            ),
          ),
        ),
        const SizedBox(
          width: 7,
        ),
        Container(
          height: 53,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 230, 230, 230),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          width: 62,
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: IconButton(
            onPressed: () {
              isSearch = true;
              context.read<StaticTripCubit>().SearchTrip();

              print(context.read<StaticTripCubit>().firstDate);
              print(context.read<StaticTripCubit>().secondDate);
              context.read<StaticTripCubit>().printll();
            },
            icon: Icon(Icons.search, size: 32, color: AppColor.primaryColor),
          ),
        ),
      ],
    );
  }

  Widget showSelectedDateRange() {
    return Row(
      children: [
        Text(
          '${context.read<StaticTripCubit>().firstDate}  ',
          style: TextStyle(fontSize: 18, color: AppColor.primaryColor),
        ),
        Icon(
          Icons.forward_outlined,
          color: AppColor.primaryColor,
        ),
        Text(
          '  ${context.read<StaticTripCubit>().secondDate}',
          style: TextStyle(fontSize: 18, color: AppColor.primaryColor),
        )
      ],
    );
  }
}
