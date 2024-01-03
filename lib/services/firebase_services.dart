import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FirebaseService {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    print('Token : $fcmToken');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint("Received message: ${message.notification?.body}");
      // ...
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      // print(event);
      // print(event.notification?.title);
      // print(event.notification?.body);
    });
  }
}

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  // print("object");
  // print(message.notification?.title);
  // print(message.notification?.body);
  // print(message.data);
}
