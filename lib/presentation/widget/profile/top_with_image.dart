import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/profile/profile_cubit.dart';
import 'package:tourism_project/core/database/cach_helper.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_routes.dart';
import 'package:tourism_project/core/utils/end_point.dart';

class TopWithImage extends StatefulWidget {
  const TopWithImage({super.key});

  @override
  State<TopWithImage> createState() => _TopWithImageState();
}

class _TopWithImageState extends State<TopWithImage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
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
                child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: //context.read<UploadImageCubit>().profilePic == null
                        state is ProfileInfo
                            ? GestureDetector(
                                onTap: () {
                                  goRoute(context, AppRoutes.viewProfileImage);
                                },
                                child: CircleAvatar(
                                    radius: 65,
                                    backgroundColor: Colors.white,
                                    backgroundImage: NetworkImage(
                                        EndPoint.imageBaseUrl +
                                            state.userInfo.image!)),
                              )
                            : CircleAvatar(
                                radius: 65,
                                backgroundColor: Colors.grey[200],
                                child: const Center(
                                  child: Icon(
                                    Icons.person,
                                    size: 65,
                                    color: Colors.grey,
                                  ),
                                ))))
          ]),
        );
      },
    );
  }
}

class ViewImage extends StatelessWidget {
  ViewImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Profile Image",
            style: TextStyle(fontSize: 22),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(Icons.delete),
            )
          ],
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(
                          File(CacheHelper().getData(key: "profileImage")))))),
        )
        //  CircleAvatar(
        //   radius: double.maxFinite,
        //   backgroundColor: Colors.white,
        //   backgroundImage:
        //       FileImage(File(CacheHelper().getData(key: "profileImage"))),
        // ),
        );
  }
}
