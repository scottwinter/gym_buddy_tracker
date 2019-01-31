import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gym Buddy'),
      ),
      body: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.fitness_center),
              title: Text('Bench Press'),
//              subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row (
                children: <Widget>[
                  Column (
                    children: <Widget>[
                      Row (
                        children: <Widget>[
                          Text("Weight")
                        ],
                      ),
                      Row (
                        children: <Widget>[
                          Text("Reps")
                        ],
                      )
                    ],
                  ),
                  Column (

                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}