import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tourism_project/business_logic/user/user_cubit.dart';
import 'package:tourism_project/core/database/cach_helper.dart';
import 'package:tourism_project/core/localization/chang_language_buttom.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_routes.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/presentation/widget/homepage/list_tile_home_widget.dart';

class WidgetDrawer extends StatelessWidget {
  const WidgetDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.secondColor,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: AppColor.primaryColor,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Tourism App',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Iconsax.moon,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ListView(
              children: [
                widgetListTile(
                  icon: Iconsax.profile_circle,
                  text: "Profile",
                  onTap: () {
                    goRoute(context, AppRoutes.profile);
                  },
                ),
                widgetListTile(
                  icon: Iconsax.location,
                  text: "My Booking",
                  onTap: () {
                    GoRouter.of(context).push(AppRoutes.detailsBookHotel);
                  },
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 0.3,
                  endIndent: 100,
                ),
                widgetListTile(
                  icon: Iconsax.setting,
                  text: "Setting",
                ),
                widgetListTile(
                  icon: Icons.help_outline,
                  text: "Payment",
                  onTap: () {
                    goRoute(context, AppRoutes.payment);
                  },
                ),
                widgetListTile(
                  icon: Iconsax.logout,
                  text: "Logout",
                  onTap: () {
                    CustomAlertDialog(
                        context,
                        "Logout",
                        "Are you sure, do you want to logOut ?",
                        'Yes',
                        'No', () {
                      BlocProvider.of<UserCubit>(context).logOut();
                      myToken = '';
                      CacheHelper()
                          .saveData(key: "isUserLoggedIn?", value: false);
                      replace(context, AppRoutes.login);
                    }, () {
                      Navigator.of(context).pop();
                    }, false);
                  },
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 0.3,
                  endIndent: 100,
                ),
                const ChangLanguageButtom(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
