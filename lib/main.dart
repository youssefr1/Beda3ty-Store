import 'package:astro/core/app/bloc_observer.dart';
import 'package:astro/core/app/connectivily_control.dart';
import 'package:astro/core/app/env.variable.dart';
import 'package:astro/core/di/injection_container.dart';
import 'package:astro/core/services/shared_pref/shared_pref.dart';
import 'package:astro/featured/splash/presentation/views/splash_view.dart';
import 'package:astro/sooqly_store_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';
import 'package:astro/featured/customer/cubit/notification_cubit.dart';
import 'package:astro/featured/customer/data/model/notification_model.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvVariable.instance.init(envType: EnvTypeEnum.dev);
  Bloc.observer = MyBlocObserver();
  await SharedPref().instantiatePreferences();
  await setupInjection();
  await Firebase.initializeApp();

  // Initialize Local Notifications
  final FlutterLocalNotificationsPlugin localNotifications = FlutterLocalNotificationsPlugin();
  
  const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
  const initSettings = InitializationSettings(android: androidInit);
  await localNotifications.initialize(initSettings);

  // Create Android Notification Channel
  if (Platform.isAndroid) {
    const channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.max,
    );

    await localNotifications
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  // Subscribe to topic and request permissions
  await FirebaseMessaging.instance.subscribeToTopic('all_users');
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );
  
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  
  // Foreground Message Listener
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    _handleIncomingMessage(message);
    final notification = message.notification;
    final android = message.notification?.android;

    if (notification != null && android != null) {
      localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'high_importance_channel',
            'High Importance Notifications',
            channelDescription: 'This channel is used for important notifications.',
            importance: Importance.max,
            priority: Priority.high,
            icon: '@mipmap/ic_launcher',
          ),
        ),
      );
    }
  });

  // Handle message when app is opened from background
  FirebaseMessaging.onMessageOpenedApp.listen(_handleIncomingMessage);

  // Check for initial message (if app was terminated)
  FirebaseMessaging.instance.getInitialMessage().then((message) {
    if (message != null) {
      _handleIncomingMessage(message);
    }
  });

  await ConnectivityControler.instance.init();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const SooqlyStoreApp());
  });
}

void _handleIncomingMessage(RemoteMessage message) {
  if (message.notification != null) {
    sl<NotificationCubit>().addNotification(
      NotificationModel.fromRemoteMessage(message),
    );
  }
}
