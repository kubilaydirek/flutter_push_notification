

https://github.com/kubilaydirek/flutter_push_notification/assets/97626735/2b9d673b-386b-45fc-bf77-8492b4f42200

Hello my friend,

To add push notification, which is a must for mobile applications;

First of all, we create a project by logging into https://console.firebase.google.com/ firebase.
![Ekran Resmi 2023-06-05 11 40 59](https://github.com/kubilaydirek/flutter_push_notification/assets/97626735/a29b3b04-25a9-405d-bbfb-4a37072019ec)

As seen on the screen, we are adding 2 applications for android and ios.

Here we want package name, we can find our package name from android -> app -> src -> main -> androidManifest.xml
sha1 code for windows pc : keytool -list -v -keystore "\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android
sha1 code for mac : keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android 
when we say next it asks us to download a google-service.json file. we download it into android -> app.

android -> app -> build.gradle dependencies should be like below;
dependencies {
    implementation platform('com.google.firebase:firebase-bom:32.1.0')
    implementation "org.jetbrains.kotlin:kotlin-stdlib-jdk7:$kotlin_version"
    implementation 'com.google.firebase:firebase-analytics-ktx'
    implementation 'com.google.firebase:firebase-messaging:23.0.0'
}



android -> app -> src -> main AndroidManifest.xml the following should be added;
    package="com.example.exampleNotification.flutter_notification">

    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.VIBRATE" />
    <intent-filter>
    <action android:name="com.google.firebase.MESSAGING_EVENT" />
    </intent-filter>
            
            
Now that the authorization parts are finished, we can write our codes.

First, we open a dart file named messaging_service.dart.
We create a class named MessagingService for this file we opened.

Necessary functions and adjustments are made for Firebase, if you wish, you can review the codes from the lib -> messaging_service.dart page.
When the onMessage.listen application is open, you can call local notification in onMessage.listen by installing the flutter_local_notifications package.
When the application is first installed, it is saved in a channel called "topic-all". If you want to send a special notification to the user, a token is printed to you every time the application runs. You can send this token.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
I am getting help from postman to send notification.
First I will send a post request from postman to https://fcm.googleapis.com/fcm/send
We add key=token to the Authorization value part of the Header key part.This token is from the firebase site;
It will come after activating Project Settings -> Cloud Messaging -> Cloud Messaging API (Legacy).
key Content-Type value application/json

<img width="841" alt="Ekran Resmi 2023-06-05 13 17 55" src="https://github.com/kubilaydirek/flutter_push_notification/assets/97626735/f14dadb3-f5be-4fbb-84bb-447aed6af8e8">

body;
<img width="839" alt="Ekran Resmi 2023-06-05 13 18 20" src="https://github.com/kubilaydirek/flutter_push_notification/assets/97626735/46f68208-c273-4dae-a0a6-87daef9c4458">








