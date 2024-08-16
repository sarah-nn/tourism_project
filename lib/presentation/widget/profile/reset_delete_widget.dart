import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_project/business_logic/profile/profile_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_routes.dart';
import 'package:tourism_project/core/functions/functions.dart';

class ResetAndDelete extends StatelessWidget {
  final String Email;
  const ResetAndDelete({super.key, required this.Email});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is DeleteAccountDone) {
          replace(context, AppRoutes.register);
        }
        if (state is ProfileChangeFaliure) {
          showAlertDialog(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                print(Email);
                GoRouter.of(context)
                    .push(AppRoutes.resetpassword, extra: Email);
              },
              child: Text(
                "Reset Password",
                style: TextStyle(
                    letterSpacing: 0.5,
                    fontSize: 16,
                    color: AppColor.primaryColor),
              ),
            ),
            Text(
              " | ",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryColor),
            ),
            InkWell(
              onTap: () {
                showAlertDialogQuestion(context, () {
                  context.read<ProfileCubit>().deleteAccount();
                }, () {
                  Navigator.pop(context);
                }, false,
                    "Are you sure that you want to\ndelete your accont ?\n\n❗ You will loose all your data .\n");
              },
              child: Text(
                "Delete Account",
                style: TextStyle(
                    letterSpacing: 0.5,
                    fontSize: 16,
                    color: AppColor.primaryColor),
              ),
            )
          ],
        );
      },
    );
  }
}
