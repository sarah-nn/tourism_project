import 'package:flutter/material.dart';
import 'package:tourism_project/data/models/user_model.dart';
import 'package:tourism_project/presentation/widget/profile/profile_field_widget.dart';
import 'package:tourism_project/presentation/widget/profile/reset_delete_widget.dart';

class CardProfileInfo extends StatefulWidget {
  UserInfoModel userInfo;
  CardProfileInfo({super.key, required this.userInfo});

  @override
  State<CardProfileInfo> createState() => _CardProfileInfoState();
}

class _CardProfileInfoState extends State<CardProfileInfo> {
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          child: Card(
            elevation: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfileField(
                      onTap: () {},
                      title: "Name",
                      userInfo: widget.userInfo.name!,
                      index: true),
                  ProfileField(
                      onTap: () {},
                      title: "Email",
                      userInfo: widget.userInfo.email!,
                      index: true),
                  ProfileField(
                      onTap: () {},
                      title: "Phone Number",
                      userInfo: widget.userInfo.phoneNumber.toString() == 'null'
                          ? "+ add"
                          : widget.userInfo.phoneNumber.toString(),
                      index: true),
                  ProfileField(
                      onTap: () {},
                      title: "Location",
                      userInfo:
                          widget.userInfo.position?.name.toString() ?? "null",
                      index: false),
                  const SizedBox(height: 50),
                  const ResetAndDelete()
                ],
              ),
            ),
          ),
        ));
  }
}
