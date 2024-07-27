import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/user/user_cubit.dart';
import 'package:tourism_project/core/database/cach_helper.dart';
import 'package:tourism_project/core/utils/app_routes.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/validation.dart';
import 'package:tourism_project/presentation/widget/auth/already_have_account_widget.dart';
import 'package:tourism_project/presentation/widget/auth/buttom_auth_widget.dart';
import 'package:tourism_project/presentation/widget/auth/text_body_auth_widget.dart';
import 'package:tourism_project/presentation/widget/auth/text_form_auth_widget.dart';
import 'package:tourism_project/presentation/widget/auth/text_title_auth_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserSuccess) {
          goRoute(context, AppRoutes.verifycodesignup);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("state.message succcessss"),
          ));
        } else if (state is UserFailure) {
          showAlertDialog(context, state.message);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 19),
            child: Form(
              key: context.read<UserCubit>().formKeyReg,
              child: ListView(
                children: [
                  const CustomTextTitleAuth(
                    textTitle: "Create Account",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomTextBodyAuth(
                      textBody:
                          "Sign Up with Your Email And Password  OR Continue With Social Media"),
                  const SizedBox(height: 65),
                  CustomTextFormAuth(
                      isPassword: false,
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 3, 100, "username");
                      },
                      mycontroller: context.read<UserCubit>().name,
                      hintText: "Enter Your Name",
                      labelText: "UserName : ",
                      passToggle: false,
                      iconData: Icons.person),
                  CustomTextFormAuth(
                      isPassword: false,
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 5, 100, "email");
                      },
                      mycontroller: context.read<UserCubit>().email,
                      hintText: "Enter Your Email",
                      labelText: "Email : ",
                      passToggle: false,
                      iconData: Icons.email_rounded),
                  CustomTextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 8, 30, "password");
                    },
                    mycontroller: context.read<UserCubit>().password,
                    hintText: "Enter Your password",
                    labelText: "Password : ",
                    passToggle: true,
                    isPassword: true,
                    iconData: Icons.lock,
                  ),
                  CustomTextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 8, 30, "password");
                    },
                    mycontroller: context.read<UserCubit>().rePassword,
                    hintText: "Confirm Your Password",
                    labelText: "Confirm Password : ",
                    iconData: Icons.lock,
                    isPassword: true,
                    passToggle: true,
                  ),
                  state is UserLoading
                      ? const Center(child: CircularProgressIndicator())
                      : CustomButtomAuth(
                          onPressed: () {
                            CacheHelper()
                                .saveData(key: "isFirstTime", value: true);
                            print('==============Tapped!!===');
                            context.read<UserCubit>().register();
                          },
                          textButtom: 'SignUp',
                        ),
                  const SizedBox(height: 20),
                  const AlreadyHaveAnAccount(
                    textone: "Already Have an accouunt ? ",
                    texttwo: "Login",
                    routeName: AppRoutes.login,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
