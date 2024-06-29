import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/profile/profile_cubit.dart';
import 'package:tourism_project/presentation/widget/profile/profile_field_widget.dart';
import 'package:tourism_project/presentation/widget/profile/reset_delete_widget.dart';

class CardProfileInfo extends StatefulWidget {
  const CardProfileInfo({super.key});

  @override
  State<CardProfileInfo> createState() => _CardProfileInfoState();
}

class _CardProfileInfoState extends State<CardProfileInfo> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getUserInfo();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileInfo) {
          print("it is righhhhhhhht");
        }
        if (state is ProfileChangeFaliure) {
          print(state.errMessage);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: state is ProfileInfo
              ? Container(
                  child: Card(
                    elevation: 1,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ProfileField(
                              title: "Name",
                              userInfo: state.userInfo.name!,
                              index: true),
                          ProfileField(
                              title: "Email",
                              userInfo: state.userInfo.email!,
                              index: true),
                          ProfileField(
                              title: "Loacation",
                              userInfo:
                                  state.userInfo.position.toString() ?? "null",
                              index: false),
                          const SizedBox(height: 50),
                          const ResetAndDelete()
                        ],
                      ),
                    ),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}
