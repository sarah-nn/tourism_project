import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/area/area_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_images.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';

class SearchAreaPage extends StatefulWidget {
  final String areaId;
  const SearchAreaPage({super.key, required this.areaId});

  @override
  State<SearchAreaPage> createState() => _SearchAreaPageState();
}

class _SearchAreaPageState extends State<SearchAreaPage> {
  List<String> areaList = [];
  @override
  void initState() {
    super.initState();
    context.read<AreaCubit>().getArea(widget.areaId);
  }

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).primaryColor;
    return BlocConsumer<AreaCubit, AreaState>(
      listener: (context, state) {
        if (state is AreaSuccess) {
          areaList = (state).areaList;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("success")));
        }
        if (state is AreaFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        return Scaffold(
            body: Column(
          children: [
            Expanded(flex: 4, child: topExpandedSearchBar(myColor)),
            Expanded(flex: 2, child: countryOrAreaSlider()),
            Expanded(
                flex: 10,
                child: state is AreaSuccess
                    ? countryGridItem(areaList)
                    : const Center(
                        child: CircularProgressIndicator(),
                      ))
          ],
        ));
      },
    );
  }
}

Widget countryGridItem(List<String> areaList) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: Container(
      child: GridView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: areaList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2.2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 13),
          itemBuilder: (BuildContext context, index) {
            return GestureDetector(
              onTap: () {
                // goRoute(context, AppRoutes.searchAreaPage);
              },
              child: Card(
                color: AppColor.secondColor,
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                    areaList[index],
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
    ),
  );
}

Widget topExpandedSearchBar(Color myColor) {
  return Container(
    decoration: BoxDecoration(
        color: myColor,
        image: DecorationImage(
          image: const AssetImage(AppImage.two),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(myColor.withOpacity(0.4), BlendMode.dstATop),
        )),
    child: Center(child: searchBar()),
  );
}

Widget countryOrAreaSlider() {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Container(
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: AppColor.primaryColor),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              height: double.maxFinite,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Text(
                "Country",
                style: MyTextStyle.normal.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                    color: AppColor.primaryColor),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.primaryColor),
              child: Text(
                "Area",
                style: MyTextStyle.normal.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                    color: Colors.white),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget searchBar() {
  return GestureDetector(
    onTap: () {},
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Container(
        height: 60,
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: Icon(Icons.search, color: AppColor.primaryColor),
            title: const Text(
              'Search for Area',
              style: TextStyle(color: Colors.black26),
            ),
          ),
        ),
      ),
    ),
  );
}
