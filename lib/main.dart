import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_buddy_tracker/routes/tab_screen.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,
  DeviceOrientation.portraitDown]);
  runApp(MainApp());
}

class MainApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gym Buddy",
      theme: ThemeData.light(),
      home: MainTabPage()
    );
  }
}