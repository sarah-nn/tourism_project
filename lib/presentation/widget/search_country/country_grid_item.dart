import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/data/models/country_model.dart';

class CountryGridItem extends StatelessWidget {
  final int listCount;
  final List<CountryModel> countryList;
  const CountryGridItem(
      {super.key, required this.listCount, required this.countryList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GridView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: countryList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2.2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 13),
          itemBuilder: (BuildContext context, index) {
            return GestureDetector(
              onTap: () {
                GoRouter.of(context).push(
                    '/placeCountryPage/${countryList[index].id}',
                    extra: countryList[index].name);
              },
              child: Card(
                color: AppColor.secondColor,
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                    countryList[index].name,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontStyle: FontStyle.italic,
                        color: Colors.black54),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
