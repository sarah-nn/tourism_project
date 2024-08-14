import 'package:firebase_messaging/firebase_messaging.dart';

class FCMServices {
  static final _firebaseMessege = FirebaseMessaging.instance;

  //get device token
  static Future<void> getFcmToken() async {
    await _firebaseMessege.requestPermission();
    final fcmToken = await _firebaseMessege.getToken();
    print("Token f: $fcmToken");
  }

  static Future<void> firebaseMessaging(RemoteMessage message) async {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');
    print("firebase message title ${message.notification?.title}");
    print("firebase message title ${message.notification?.body}");

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  }
}
