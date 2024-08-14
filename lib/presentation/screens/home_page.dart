import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tourism_project/business_logic/dont_miss/dont_miss_cubit.dart';
import 'package:tourism_project/core/database/cach_helper.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_images.dart';
import 'package:tourism_project/core/utils/app_routes.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/dont_miss_model.dart';
import 'package:tourism_project/data/models/top_visited_model.dart';
import 'package:tourism_project/presentation/widget/homepage/card_category_widget.dart';
import 'package:tourism_project/presentation/widget/homepage/card_dont_miss.dart';
import 'package:tourism_project/presentation/widget/homepage/card_top_visit_widget.dart';
import 'package:tourism_project/presentation/widget/homepage/drawer_widget.dart';
import 'package:tourism_project/presentation/widget/homepage/top_visited_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String saveImage = CacheHelper().getData(key: "profileImage") ?? '';
  List<DontMissModel> dontMissModel = [];
  List<TopVisitedModel> topVisitedModel = [];

  @override
  void initState() {
    super.initState();
    context.read<DontMissCubit>().getDontMiss();
    context.read<DontMissCubit>().getTopVisited();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DontMissCubit, DontMiisState>(
        listener: (context, state) {
      if (state is DontMiisSuccess) {
        dontMissModel = state.dontMissModel;
      }
      if (state is DontMiisFailure) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.errMessage)));
      }
      if (state is TopVisitedSuccess) {
        topVisitedModel = state.topVisitedModel;
        print('11111111122222211111111$topVisitedModel');
      }
      if (state is TopVisitedFailure) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.errMessage)));
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: light ? Colors.white : AppColor.primaryColorDark,
          elevation: 0,
          iconTheme: IconThemeData(
              color: light ? Colors.black : Colors.white, size: 30),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.notifications_active,
                color: light ? AppColor.primaryColor : AppColor.iconsColorDark,
                size: 27,
              ),
            )
          ],
        ),
        drawer: const WidgetDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(14),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Discover",
                        style: MyTextStyle.bright.copyWith(
                            color: light ? Colors.black : Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 38,
                            letterSpacing: 1)
                        //TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                    // IconButton(
                    //   icon: Icon(
                    //     Icons.notifications_active,
                    //     color: AppColor.primaryColor,
                    //   ),
                    //   onPressed: () {},
                    // )
                    //!-----------------------------
                    // saveImage != ''
                    //     ? CircleAvatar(
                    //         radius: 22,
                    //         backgroundColor: Colors.grey[200],
                    //         child: const Center(
                    //           child: Icon(
                    //             Icons.person,
                    //             size: 22,
                    //             color: Colors.grey,
                    //           ),
                    //         ))
                    //     : CircleAvatar(
                    //         radius: 22,
                    //         backgroundColor: Colors.white,
                    //         backgroundImage: FileImage(
                    //           File(CacheHelper().getData(key: "profileImage")),
                    //         )
                    //!-------------------------------
                    //AssetImage(context.read<UploadImageCubit>().profilePic)
                    // NetworkImage(
                    //     EndPoint.imageBaseUrl +
                    //         state.userInfo.image!)
                    // )
                    // Container(
                    //   padding: EdgeInsets.all(3),
                    //   decoration: BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     color: AppColor.secondColor,
                    //   ),
                    //   child: const CircleAvatar(
                    //       radius: 22,
                    //       backgroundImage: AssetImage(
                    //           AppImage.person) //AssetImage(AppImage.person),
                    //       ),
                    // )
                  ],
                ),
                Text("The world...",
                    style: MyTextStyle.poppins.copyWith(
                        fontWeight: FontWeight.w100,
                        fontSize: 20,
                        color: light ? Colors.black : Colors.white)
                    //TextStyle(fontSize: 18),
                    ),
                const SizedBox(height: 10),

                /******** SEARCH ********/
                GestureDetector(
                  onTap: () {
                    goRoute(context, AppRoutes.searchCountryPage);
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Icon(Iconsax.search_favorite,
                          color: light
                              ? AppColor.primaryColor
                              : AppColor.iconsColorDark),
                      title: Text(
                        'Find Country or Area',
                        style: TextStyle(
                            color: light ? Colors.black26 : Colors.white38),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                /***** SLIDER OFFERS *****/
                const Text(
                  'Top Visited',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                //  topVisitSlider(),
                CarouselSlider(
                  items: [
                    ...List.generate(
                        topVisitedModel.length,
                        (index) => TopVisitedSlider(
                              topVisitedModel: topVisitedModel[index],
                            )),
                  ],
                  options: CarouselOptions(
                    enableInfiniteScroll: true,
                    reverse: false,
                    height: 200,
                    aspectRatio: 12 / 2,
                    viewportFraction: 1.0,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    autoPlay: true,
                    autoPlayInterval:
                        Duration(seconds: 3), // الفترة الزمنية بين كل تمريرة
                    autoPlayAnimationDuration:
                        Duration(seconds: 1), // مدة حركة التمرير
                    autoPlayCurve: Curves.easeInOut,
                  ),
                ),
                const SizedBox(height: 20),

                /***** CATEGORIES *****/
                const Text(
                  "Services",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CardCategouries(
                          path: AppRoutes.flightPage,
                          image: AppIcon.plan,
                          nameCategory: "flight"),
                      const SizedBox(width: 20),
                      CardCategouries(
                          path: AppRoutes.staticTrip,
                          image: AppIcon.trip,
                          nameCategory: "trip"),
                      const SizedBox(width: 20),
                      CardCategouries(
                          path: AppRoutes.hotelPage,
                          image: AppIcon.hotel,
                          nameCategory: "hotel"),
                      const SizedBox(width: 20),
                      CardCategouries(
                          // path: AppRoutes.places,
                          path: AppRoutes.test,
                          image: AppIcon.plan,
                          nameCategory: "Inspire"),
                    ],
                  ),
                ),
                const SizedBox(height: 15),

                /***** TOP VISIT *****/
                // dontMissModel.isEmpty
                //     ? Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           const Text(
                //             "Top Visited ",
                //             style: TextStyle(
                //                 fontSize: 20, fontWeight: FontWeight.bold),
                //           ),
                //           const SizedBox(height: 10),
                //           Container(
                //             height: 220,
                //             child: ListView.builder(
                //               scrollDirection: Axis.horizontal,
                //               itemBuilder: (BuildContext context, int index) {
                //                 return CardTopVisit();
                //               },
                //             ),
                //           ),
                //         ],
                //       )
                dontMissModel.isNotEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Dont miss ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            height: 230,
                            child: ListView.builder(
                                itemCount: dontMissModel.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return CardDonntMiss(
                                    dontMissModel: dontMissModel[index],
                                  );
                                }),
                          ),
                        ],
                      )
                    : Container()
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget topVisitSlider() {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColor.thirdColor,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(40),
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
          child: Image.asset(
            AppImage.two,
            fit: BoxFit.fill,
          ),
        ),
        const Positioned(
            top: 140,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Eiffel Tower",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Philosopher'),
                ),
                Row(
                  children: [
                    Icon(
                      Iconsax.location,
                      color: Color.fromARGB(255, 53, 159, 245),
                    ),
                    Text(
                      'Syria , Damas',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ],
            ))
      ],
    );
  }
}
