import 'package:flutter/material.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gym Buddy",
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Gym Buddy'),
        ),
        body: Center(
          child: Text('This will be your workout routines'),
        ),
      ),
    );
  }
}