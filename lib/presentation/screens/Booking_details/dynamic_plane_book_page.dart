import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:tourism_project/business_logic/details_book.dart/details_book_plane_cubit.dart';
import 'package:tourism_project/business_logic/details_book.dart/show_details_book_plane_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_images.dart';
import 'package:tourism_project/core/utils/app_routes.dart';
import 'package:tourism_project/data/models/details_book_plane_model.dart';
import 'package:tourism_project/presentation/widget/Booking/card_plane_book.dart';
import 'package:tourism_project/presentation/widget/Booking/text_address_edit_page.dart';
import 'package:tourism_project/presentation/widget/animation_text/hero_text.dart';

class PlaneBookPage extends StatefulWidget {
  const PlaneBookPage({super.key});

  @override
  State<PlaneBookPage> createState() => _PlaneBookPageState();
}

class _PlaneBookPageState extends State<PlaneBookPage> {
  List<DetailsBookPlaneModel> detailsBookPlane = [];

  bool isExpanded = false;
  void toggleExpande() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  void _handleDelete(int id) {
    setState(() {
      detailsBookPlane.removeWhere((plane) => plane.id == id);
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<DetailsBookPlaneCubit>().getAllDetailsBookPlane();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsBookPlaneCubit, DetailsBookPlaneState>(
        listener: (context, state) {
      if (state is DetailsBookPlaneSuccess) {
        detailsBookPlane = (state).detailsBookPlane;
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(const SnackBar(content: Text("state.success")));
      }
      if (state is DetailsBookPlaneFailure) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("state.fauil")));
      }
    }, builder: (context, state) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 5),
            detailsBookPlane.isNotEmpty
                ? AddressEditAnPage(
                    text: 'Your Plane',
                    color: Colors.black,
                    fontSize: 35,
                  )
                : const Text(''),
            const SizedBox(height: 5),
            Expanded(
                child: state is DetailsBookPlaneSuccess?
                    ? Center(
                        child: detailsBookPlane.isEmpty
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 10),
                                  const Text(
                                    'Not found any Booking',
                                    style: TextStyle(
                                        fontFamily: 'normal',
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54),
                                  ),
                                  const SizedBox(height: 15),
                                  TextButton(
                                      onPressed: () {
                                        GoRouter.of(context)
                                            .push(AppRoutes.flightPage);
                                      },
                                      child: ScaleTextOrIcon(
                                        icon: false,
                                        text: 'Booking now !',
                                        style: TextStyle(
                                          fontFamily: 'Pacifico',
                                          fontSize: 24,
                                          color: AppColor.primaryColor,
                                        ),
                                        icons: null,
                                      )),
                                  const SizedBox(height: 10)
                                ],
                              )
                            : ListView.builder(
                                itemCount: detailsBookPlane.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return BlocProvider(
                                    create: (context) =>
                                        ShowDetailsBookPlaneCubit(),
                                    child: CardPlaeBook(
                                      detailsBookPlaneModel:
                                          detailsBookPlane[index],
                                      onDelete: () => _handleDelete(
                                          detailsBookPlane[index].id),
                                    ),
                                  );
                                },
                              ),
                      )
                    : Center(
                        child: Container(
                            height: 200,
                            width: 200,
                            child: Lottie.asset(AppImage.loading))))
          ]),
        ),
      );
    });
  }
}
