import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class MessagingService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future<void> init() async {
    await _fcm.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    await _fcm.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    await _fcm.subscribeToTopic("topic-all");

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("onMessage: ${message.data.toString()}");
    });
    var token = await _fcm.getToken();
    print('Token: ' + token.toString());
  }
}
