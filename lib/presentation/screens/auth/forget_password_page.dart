import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_project/business_logic/forgetpassword/forgetpassword_cubit.dart';
import 'package:tourism_project/core/utils/app_routes.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/validation.dart';
import 'package:tourism_project/presentation/widget/auth/buttom_auth_widget.dart';
import 'package:tourism_project/presentation/widget/auth/custom_appbar.dart';
import 'package:tourism_project/presentation/widget/auth/text_body_auth_widget.dart';
import 'package:tourism_project/presentation/widget/auth/text_form_auth_widget.dart';
import 'package:tourism_project/presentation/widget/auth/text_title_auth_widget.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetpasswordCubit, ForgetpasswordState>(
      listener: (context, state) {
        if (state is ForgetpasswordSuccess) {
          // goRoute(context, AppRoutes.resetpassword);
          GoRouter.of(context).push(AppRoutes.resetpassword, extra: '');
          print("✅✅ ${state.messageSuccess}");
        } else if (state is ForgetpasswordFailure) {
          showAlertDialog(context, state.messageFail);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: customAppBar('Forget Password '),
          body: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 23),
            child: Form(
              key: context.read<ForgetpasswordCubit>().formKeyCheckEmail,
              child: ListView(
                children: [
                  const CustomTextTitleAuth(
                    textTitle: "Check Email",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomTextBodyAuth(
                      textBody:
                          "Please Enter Your Address to Recive Verfitication Code"),
                  const SizedBox(height: 65),
                  CustomTextFormAuth(
                      isPassword: false,
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 5, 100, "email");
                      },
                      mycontroller: context.read<ForgetpasswordCubit>().email,
                      hintText: "Enter Your Email",
                      labelText: "Email :",
                      passToggle: false,
                      iconData: Icons.email),
                  state is ForgetpasswordLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : CustomButtomAuth(
                          textButtom: 'Check',
                          onPressed: () {
                            context
                                .read<ForgetpasswordCubit>()
                                .forgetPassword();
                            // goRoute(context, '/resetpassword');
                          }),
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
