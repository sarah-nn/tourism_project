import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/profile/profile_cubit.dart';
import 'package:tourism_project/core/database/cach_helper.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_routes.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/presentation/widget/profile/card_profile_info_widget.dart';
import 'package:tourism_project/presentation/widget/profile/edit_image.dart';
import 'package:tourism_project/presentation/widget/profile/top_with_image.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEnterPosition = false;
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileInfo) {
          setState(() {
            state.userInfo.position != null
                ? isEnterPosition = false
                : isEnterPosition = true;
          });
          print(isEnterPosition);
          print("get profile info success");
        } else {
          print("profile info not done");
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: profileAppBar(context),
            body: state is ProfileInfo
                ? ListView(
                    children: [
                      TopWithImage(profileImage: state.userInfo.image ?? ''),
                      const EditImage(),
                      const SizedBox(height: 10),
                      isEnterPosition
                          ? Container(
                              padding: EdgeInsets.only(left: 30),
                              child: const Text(
                                "!! Position is requierd",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 16),
                              ),
                            )
                          : Container(),
                      CardProfileInfo(
                        userInfo: state.userInfo,
                      ),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ));
      },
    );
  }

  PreferredSizeWidget profileAppBar(BuildContext context) {
    bool isPositionNull = CacheHelper().getData(key: "userPosition") ?? false;
    return AppBar(
      backgroundColor: AppColor.primaryColor,
      elevation: 0,
      actions: [
        TextButton(
            onPressed: () {
              print(isPositionNull);

              isPositionNull ? replace(context, AppRoutes.homePage) : null;
              //  !isEnterPosition ? null : replace(context, AppRoutes.homePage);
            },
            child: const Text(
              "Save",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1,
                fontSize: 15,
              ),
            ))
      ],
    );
  }
}
