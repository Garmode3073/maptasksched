import 'dart:isolate';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maptasksched/loc.dart';

@pragma('vm:entry-point')
void callback() async {
  final DateTime now = DateTime.now();
  final int isolateId = Isolate.current.hashCode;
  //get current latitude and longitude
  var pos = await Geolocator.getCurrentPosition();
  print(pos.latitude);
  var flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  var initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  flutterLocalNotificationsPlugin.initialize(initializationSettings);
  flutterLocalNotificationsPlugin.show(
      DateTime.now().millisecondsSinceEpoch % 100000000,
      'Current Co-ordinates',
      'This notification was scheduled at ${DateTime.now().millisecondsSinceEpoch} with latitude ${pos.latitude} and longitude ${pos.longitude}',
      const NotificationDetails(
          android: AndroidNotificationDetails(
              'your channel id', 'your channel name',
              importance: Importance.max,
              priority: Priority.high,
              showWhen: false)));
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AndroidAlarmManager.initialize();
  runApp(const MyApp());
  await AndroidAlarmManager.periodic(
    const Duration(minutes: 3),
    0,
    callback,
    startAt: DateTime.now(),
    exact: true,
    wakeup: true,
    rescheduleOnReboot: true,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const GetLocation(),
    );
  }
}
