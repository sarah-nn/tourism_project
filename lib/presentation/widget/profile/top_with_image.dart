import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_project/business_logic/upload_image/upload_image_cubit.dart';
import 'package:tourism_project/core/database/cach_helper.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_routes.dart';
import 'package:tourism_project/core/utils/end_point.dart';

class TopWithImage extends StatefulWidget {
  String profileImage;
  TopWithImage({super.key, required this.profileImage});

  @override
  State<TopWithImage> createState() => _TopWithImageState();
}

class _TopWithImageState extends State<TopWithImage> {
  String saveImage = CacheHelper().getData(key: "profileImage") ?? '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
          height: MediaQuery.of(context).size.height / 12,
          decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
        ),
        Positioned(
            top: MediaQuery.of(context).size.height / 70,
            right: MediaQuery.of(context).size.width / 2.95,
            child: BlocConsumer<UploadImageCubit, UploadImageState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: context.read<UploadImageCubit>().profilePic != null
                        ? GestureDetector(
                            onTap: () {
                              GoRouter.of(context).push(
                                  AppRoutes.viewProfileImage,
                                  extra: widget.profileImage);
                            },
                            child: CircleAvatar(
                              radius: 55,
                              backgroundColor: Colors.white,
                              backgroundImage: FileImage(File(context
                                  .read<UploadImageCubit>()
                                  .profilePic!
                                  .path)),
                            ),
                          )
                        : widget.profileImage == ''
                            ? CircleAvatar(
                                radius: 55,
                                backgroundColor: Colors.grey[200],
                                child: const Center(
                                  child: Icon(
                                    Icons.person,
                                    size: 65,
                                    color: Colors.grey,
                                  ),
                                ))
                            : InkWell(
                                onTap: () {
                                  print("image view tapp");
                                  GoRouter.of(context).push(
                                      AppRoutes.viewProfileImage,
                                      extra: widget.profileImage);
                                },
                                child: CircleAvatar(
                                    radius: 58,
                                    backgroundColor: Colors.white,
                                    backgroundImage: NetworkImage(
                                        EndPoint.imageBaseUrl +
                                            widget.profileImage)),
                              ));
              },
            ))
      ]),
    );
  }
}

class ViewImage extends StatefulWidget {
  String image;
  ViewImage({super.key, required this.image});

  @override
  State<ViewImage> createState() => _ViewImageState();
}

class _ViewImageState extends State<ViewImage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadImageCubit, UploadImageState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Profile Image",
                style: TextStyle(fontSize: 22),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: IconButton(
                    onPressed: () async {
                      CustomAlertDialog(
                          context,
                          "delete Image",
                          "Are you sure, do you want to delete profile image ?",
                          'Yes',
                          'No', () async {
                        goRoute(context, AppRoutes.homePage);
                        await context.read<UploadImageCubit>().deleteImage();
                        await CacheHelper().removeData(key: "profileImage");
                      }, () {
                        context.pop();
                      }, false);
                    },
                    icon: Icon(Icons.delete),
                  ),
                )
              ],
              backgroundColor: Colors.black,
            ),
            backgroundColor: Colors.black,
            body: Center(
                child: widget.image != ''
                    ? Container(
                        height: 400,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    EndPoint.imageBaseUrl + widget.image))),
                      )
                    : Container()));
      },
    );
  }
}
