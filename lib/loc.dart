//create a stateful widget
import 'dart:async';
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class GetLocation extends StatefulWidget {
  const GetLocation({super.key});

  @override
  State<GetLocation> createState() => _GetLocationState();
}

class _GetLocationState extends State<GetLocation> {
  @override
  void initState() {
    // var flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    // var initializationSettingsAndroid =
    //     AndroidInitializationSettings('@mipmap/ic_launcher');
    // var initializationSettings =
    //     InitializationSettings(android: initializationSettingsAndroid);
    // flutterLocalNotificationsPlugin.initialize(initializationSettings);
    // flutterLocalNotificationsPlugin.periodicallyShow(
    //     0,
    //     'Scheduled Notification',
    //     'This notification was scheduled at ${DateTime.now().millisecondsSinceEpoch}',
    //     RepeatInterval.everyMinute,
    //     const NotificationDetails(
    //         android: AndroidNotificationDetails(
    //             'your channel id', 'your channel name',
    //             importance: Importance.max,
    //             priority: Priority.high,
    //             showWhen: false)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
