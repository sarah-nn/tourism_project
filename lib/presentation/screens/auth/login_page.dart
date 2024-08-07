import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/user/user_cubit.dart';
import 'package:tourism_project/core/database/cach_helper.dart';
import 'package:tourism_project/core/utils/app_routes.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/core/validation.dart';
import 'package:tourism_project/presentation/widget/auth/buttom_auth_widget.dart';
import 'package:tourism_project/presentation/widget/auth/dont_have_account_widget.dart';
import 'package:tourism_project/presentation/widget/auth/logo_auth_widget.dart';
import 'package:tourism_project/presentation/widget/auth/text_body_auth_widget.dart';
import 'package:tourism_project/presentation/widget/auth/text_form_auth_widget.dart';
import 'package:tourism_project/presentation/widget/auth/text_title_auth_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        bool isFirstTime = CacheHelper().getData(key: "isFirstTime") ?? false;
        if (state is UserSuccess) {
          CacheHelper().saveData(key: "isUserLoggedIn?", value: true);
          myToken = CacheHelper().getData(key: 'token');
          isFirstTime
              ? goRoute(context, AppRoutes.profile)
              : goRoute(context, AppRoutes.homePage);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("success"),
            ),
          );
        } else if (state is UserFailure) {
          showAlertDialog(context, state.message);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            // padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 23),
            child: Form(
              key: context.read<UserCubit>().formKeyLogin,
              child: ListView(
                children: [
                  const LogoAuth(),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 23),
                    child: Column(
                      children: [
                        const CustomTextTitleAuth(
                          textTitle: "Welcome Back",
                        ),
                        const CustomTextBodyAuth(
                            textBody: "Sign in with Email And Password "),
                        const SizedBox(height: 65),
                        CustomTextFormAuth(
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 5, 100, "email");
                          },
                          mycontroller: context.read<UserCubit>().loginEmail,
                          hintText: "Enter Your Email",
                          labelText: "Email : ",
                          iconData: Icons.email_rounded,
                          isPassword: false,
                          passToggle: false,
                        ),
                        CustomTextFormAuth(
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 8, 100, "password");
                          },
                          mycontroller: context.read<UserCubit>().loginPassword,
                          hintText: "Enter Your Password",
                          labelText: "Password : ",
                          iconData: Icons.lock,
                          //  icon_password: Icons.visibility,
                          isPassword: true,
                          passToggle: true,
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            goRoute(context, AppRoutes.forgetPassword);
                          },
                          child: const Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Forget Password ?",
                            ),
                          ),
                        ),
                        state is UserLoading
                            ? const Center(child: CircularProgressIndicator())
                            : CustomButtomAuth(
                                onPressed: () {
                                  context.read<UserCubit>().login();

                                  //goRoute(context, AppRoutes.homePage);
                                },
                                textButtom: 'Login',
                              ),
                        const SizedBox(height: 25),
                        const DontHaveAccount()
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
