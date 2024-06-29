import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:tourism_project/business_logic/user/user_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_routes.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/presentation/widget/auth/custom_appbar.dart';
import 'package:tourism_project/presentation/widget/auth/text_body_auth_widget.dart';
import 'package:tourism_project/presentation/widget/auth/text_title_auth_widget.dart';

class VerfiyCodeSignUp extends StatelessWidget {
  const VerfiyCodeSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserSuccess) {
          showAlertSuccess(
              context, "create your account", "Go Home", AppRoutes.homePage);
        } else if (state is UserFailure) {
          showAlertDialog(context, state.message);
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: customAppBar('Verification Code'),
            body: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: ListView(children: [
                const SizedBox(height: 20),
                const CustomTextTitleAuth(textTitle: "Check code"),
                const SizedBox(height: 10),
                const CustomTextBodyAuth(
                    textBody:
                        "Please Enter The Digit Code Sent To example@gmail.com"),
                const SizedBox(height: 80),
                OtpTextField(
                  enabledBorderColor: Color.fromARGB(255, 63, 62, 62),
                  //  fieldWidth: 50.0,
                  // fieldWidth: 45.0,
                  borderRadius: BorderRadius.circular(20),
                  numberOfFields: 6,
                  borderColor: AppColor.primaryColor,
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    context.read<UserCubit>().verifyCode(verificationCode);
                  }, // end onSubmit
                ),
                const SizedBox(height: 40),
              ]),
            ));
      },
    );
  }
}
