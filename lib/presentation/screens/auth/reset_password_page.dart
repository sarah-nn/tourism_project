import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/forgetpassword/forgetpassword_cubit.dart';
import 'package:tourism_project/core/utils/app_routes.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/validation.dart';
import 'package:tourism_project/presentation/widget/auth/buttom_auth_widget.dart';
import 'package:tourism_project/presentation/widget/auth/custom_appbar.dart';
import 'package:tourism_project/presentation/widget/auth/text_body_auth_widget.dart';
import 'package:tourism_project/presentation/widget/auth/text_form_auth_widget.dart';
import 'package:tourism_project/presentation/widget/auth/text_title_auth_widget.dart';

class ResetPasswordPage extends StatelessWidget {
  final String? email;
  const ResetPasswordPage({super.key, @required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetpasswordCubit, ForgetpasswordState>(
      listener: (context, state) {
        if (state is ForgetpasswordSuccess) {
          showAlertSuccess(
              context, "reset your password", "Go to login", AppRoutes.login);
        } else if (state is ForgetpasswordFailure) {
          showAlertDialog(context, state.messageFail);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: customAppBar('Reset Password '),
          body: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 23),
            child: Form(
              key: context.read<ForgetpasswordCubit>().formKeyResetPassword,
              child: ListView(
                children: [
                  const CustomTextTitleAuth(
                    textTitle: "New Password",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomTextBodyAuth(
                      textBody: "Please Enter New Password "),
                  const SizedBox(height: 65),
                  CustomTextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 5, 30, "password");
                    },
                    mycontroller: context.read<ForgetpasswordCubit>().password,
                    hintText: "Enter Your Password",
                    labelText: "Password :",
                    isPassword: true,
                    passToggle: false,
                    iconData: Icons.lock,
                  ),
                  CustomTextFormAuth(
                    iconData: Icons.lock,
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 5, 30, "password");
                    },
                    mycontroller:
                        context.read<ForgetpasswordCubit>().rePassword,
                    hintText: "Confirm your Password ",
                    labelText: "Confirm Password :",
                    isPassword: true,
                    passToggle: false,
                  ),
                  const SizedBox(height: 20),
                  state is ForgetpasswordLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : CustomButtomAuth(
                          onPressed: () {
                            context
                                .read<ForgetpasswordCubit>()
                                .reSetPassword(email == '' ? '' : email);
                          },
                          textButtom: 'Reset',
                        ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
