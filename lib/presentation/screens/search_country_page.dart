import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/country/country_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_images.dart';
import 'package:tourism_project/data/models/country_model.dart';
import 'package:tourism_project/presentation/widget/search_country/country_grid_item.dart';

class SearchCountryPage extends StatefulWidget {
  const SearchCountryPage({super.key});

  @override
  State<SearchCountryPage> createState() => _SearchCountryPageState();
}

class _SearchCountryPageState extends State<SearchCountryPage> {
  final searchcontroller = TextEditingController();

  List<CountryModel> countryList = [];
  List<CountryModel> countrySearchedList = [];
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    context.read<CountryCubit>().getAllCountrey();
  }

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).primaryColor;
    return BlocConsumer<CountryCubit, CountryState>(
      listener: (context, state) {
        if (state is CountrySuccess) {
          countryList = (state).countryList;
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("success")));
        }
        if (state is CountryFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        return Scaffold(
            body: Column(
          children: [
            topExpandedSearchBar(myColor),
            Expanded(
                child: state is CountrySuccess
                    ? isSearching
                        ? countrySearchedList.isEmpty &&
                                searchcontroller.text.isNotEmpty
                            ? const Center(
                                child: Text(
                                "No Result",
                                style: TextStyle(fontSize: 25),
                              ))
                            : CountryGridItem(
                                listCount: countrySearchedList.isNotEmpty
                                    ? countrySearchedList.length
                                    : countryList.length,
                                countryList: countrySearchedList.isNotEmpty
                                    ? countrySearchedList
                                    : countryList)
                        : CountryGridItem(
                            listCount: countrySearchedList.isNotEmpty
                                ? countryList.length
                                : countryList.length,
                            countryList: countrySearchedList.isNotEmpty
                                ? countrySearchedList
                                : countryList)
                    : const Center(
                        child: CircularProgressIndicator(),
                      ))
          ],
        ));
      },
    );
  }

  Widget searchedBarItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      //  Card(
      // elevation: 5,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(10),
      // ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white.withOpacity(0.8),
        ),
        child: TextFormField(
          cursorColor: Colors.white,
          controller: searchcontroller,
          onChanged: (val) {
            addDataToFilteredList(input: val);
          },
          decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.search,
                color: AppColor.primaryColor,
              ),
              border: InputBorder.none,
              hintText: "  search for Places",
              hintStyle: TextStyle(color: Colors.black54)),
        ),
      ),
    );
  }

  Widget appBarItem() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSearching = true;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white.withOpacity(0.8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "  search for Places",
                style: TextStyle(color: Colors.black54, fontSize: 15.5),
              ),
              Icon(
                Icons.search,
                color: AppColor.primaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }

  void addDataToFilteredList({required String input}) {
    setState(() {
      countrySearchedList = countryList
          .where((element) => element.name.toLowerCase().startsWith(input))
          .toList();
    });
  }

  // Widget countryGridItem(int listCount, List<CountryModel> countryList) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 12),
  //     child: GridView.builder(
  //         scrollDirection: Axis.vertical,
  //         shrinkWrap: true,
  //         itemCount: countryList.length,
  //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //             crossAxisCount: 2,
  //             childAspectRatio: 2.2,
  //             crossAxisSpacing: 4,
  //             mainAxisSpacing: 13),
  //         itemBuilder: (BuildContext context, index) {
  //           return GestureDetector(
  //             onTap: () {},
  //             child: Card(
  //               color: AppColor.secondColor,
  //               elevation: 4,
  //               child: Padding(
  //                 padding: const EdgeInsets.only(top: 10, left: 10),
  //                 child: Text(
  //                   countryList[index].name,
  //                   style: const TextStyle(
  //                       fontSize: 25,
  //                       fontWeight: FontWeight.bold,
  //                       letterSpacing: 1,
  //                       fontStyle: FontStyle.italic,
  //                       color: Colors.black54),
  //                 ),
  //               ),
  //             ),
  //           );
  //         }),
  //   );
  // }

  Widget topExpandedSearchBar(Color myColor) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          color: myColor,
          image: DecorationImage(
            image: const AssetImage(AppImage.two),
            fit: BoxFit.cover,
            colorFilter:
                ColorFilter.mode(myColor.withOpacity(0.4), BlendMode.dstATop),
          )),
      child: Center(
        child: isSearching ? searchedBarItem() : appBarItem(),
      ),
    );
  }

  // Widget countryOrAreaSlider() {
  //   return Padding(
  //     padding: const EdgeInsets.all(15.0),
  //     child: Container(
  //       decoration: BoxDecoration(
  //           border: Border.all(width: 2, color: AppColor.primaryColor),
  //           borderRadius: BorderRadius.circular(20)),
  //       child: Row(
  //         children: [
  //           Expanded(
  //             child: Container(
  //               alignment: Alignment.center,
  //               height: double.maxFinite,
  //               decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(20),
  //                   color: AppColor.primaryColor),
  //               child: Text(
  //                 "Country",
  //                 style: MyTextStyle.normal.copyWith(
  //                     fontWeight: FontWeight.bold,
  //                     fontSize: 27,
  //                     color: Colors.white),
  //               ),
  //             ),
  //           ),
  //           Expanded(
  //             child: Container(
  //               alignment: Alignment.center,
  //               height: double.maxFinite,
  //               decoration: const BoxDecoration(
  //                 borderRadius: BorderRadius.only(
  //                     topRight: Radius.circular(20),
  //                     bottomRight: Radius.circular(20)),
  //               ),
  //               child: Text(
  //                 "Area",
  //                 style: MyTextStyle.normal.copyWith(
  //                     fontWeight: FontWeight.bold,
  //                     fontSize: 27,
  //                     color: AppColor.primaryColor),
  //               ),
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
