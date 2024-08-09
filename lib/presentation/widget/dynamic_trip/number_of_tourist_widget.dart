import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tourism_project/business_logic/dynamicTrip/dynamic_trip_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_images.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';

class NumberOfTourist extends StatefulWidget {
  const NumberOfTourist({super.key});

  @override
  State<NumberOfTourist> createState() => _NumberOfTouristState();
}

class _NumberOfTouristState extends State<NumberOfTourist> {
  bool isNumer = false;
  int _counter = 1;
  bool isChoose = false;
  int choosenNum = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 1) _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DynamicTripCubit, DynamicTripState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "who do you Want to Travel with ?",
                style: MyTextStyle.normal.copyWith(fontSize: 25),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                customGridFeild("Friends", AppIcon.friend, () {
                  setState(() {
                    isNumer = true;
                  });
                }),
                const SizedBox(width: 15),
                customGridFeild("Single", AppIcon.single, () {
                  context.read<DynamicTripCubit>().numOfPeople = 1;
                  setState(() {
                    isChoose = true;
                    choosenNum = 1;
                  });
                }),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                customGridFeild("Couple", AppIcon.couple, () {
                  context.read<DynamicTripCubit>().numOfPeople = 2;
                  setState(() {
                    isChoose = true;
                    choosenNum = 2;
                  });
                }),
                const SizedBox(width: 15),
                customGridFeild("Family", AppIcon.family, () {
                  setState(() {
                    isNumer = true;
                  });
                })
              ],
            ),
            const SizedBox(height: 35),
            isNumer
                ? determineNum("How many Memmbers ?")
                : const SizedBox(
                    height: 1,
                  ),
            isChoose || context.read<DynamicTripCubit>().numOfPeople != 0
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    width: double.maxFinite,
                    color: const Color.fromARGB(255, 233, 233, 233),
                    child: Text(
                      "-> Book for ${context.read<DynamicTripCubit>().numOfPeople}",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : Container(),
          ],
        ));
      },
    );
  }

  Widget determineNum(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
              color: Colors.black54, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(children: [
                IconButton(
                    onPressed: () {
                      _incrementCounter();
                    },
                    icon: const Icon(
                      Iconsax.add_circle_copy,
                      size: 28,
                    )),
                Text(
                  "$_counter",
                  style: MyTextStyle.Pacifico.copyWith(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 29),
                ),
                IconButton(
                    onPressed: () {
                      _decrementCounter();
                    },
                    icon: const Icon(
                      Iconsax.minus_cirlce_copy,
                      size: 29,
                    ))
              ]),
            ),
            IconButton(
                onPressed: () {
                  context.read<DynamicTripCubit>().numOfPeople = _counter;
                  setState(() {
                    isNumer = false;
                    isChoose = true;
                    choosenNum = _counter;
                  });
                },
                icon: const Icon(
                  Icons.done_outline,
                  color: Color.fromARGB(255, 55, 129, 57),
                ))
          ],
        ),
      ],
    );
  }

  Widget customGridFeild(name, icon, ontap) {
    return InkWell(
      onTap: ontap,
      child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              color: AppColor.primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(18)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 40,
                width: 40,
                //color: Colors.amber,
                child: Image.asset(icon),
              ),
              Text(
                name,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColor.primaryColor),
              )
            ],
          )),
    );
  }
}
