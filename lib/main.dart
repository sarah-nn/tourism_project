import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/theme/app_theme_cubit.dart';
import 'package:tourism_project/business_logic/theme/app_theme_state.dart';
import 'package:tourism_project/business_logic/user/user_cubit.dart';
import 'package:tourism_project/core/database/cach_helper.dart';
import 'package:tourism_project/core/fcm_services.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/themestate.dart';
import 'package:tourism_project/routers.dart';

Future<void> _firebaseMessaging(RemoteMessage message) async {
  FCMServices.firebaseMessaging(message);
  print("notificatin com");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  CacheHelper().saveData(key: 'light', value: light);

  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyDLp52E7-yzXST6OHAYT5dWF1Gjfl2ZP1M",
    appId: '1:707645520656:android:3bfce7c9c26c891ad58395',
    messagingSenderId: '707645520656',
    projectId: 'test-49b2e',
    storageBucket: 'test-49b2e.appspot.com',
  ));
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  await FCMServices.getFcmToken();
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.notification?.title}');
    print('Message data: ${message.notification?.body}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });
  runApp(
    BlocProvider(
      create: (context) => UserCubit(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppThemeCubit()..changeTheme(ThemeState.Initial),
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (BuildContext context, AppThemeState state) {
          if (state is AppDarkTheme) {
            light = false;
            return MaterialApp.router(
              theme: ThemeData.dark(),
              debugShowCheckedModeBanner: false,
              routerConfig: router,
            );
          } else {
            light = true;
            return MaterialApp.router(
              theme: ThemeData.light(),
              debugShowCheckedModeBanner: false,
              routerConfig: router,
            );
          }
        },
      ),
    );
  }
}
