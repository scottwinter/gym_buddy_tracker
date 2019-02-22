import 'package:flutter/material.dart';
import 'package:gym_buddy_tracker/routes/manage_exercises.dart';
import 'package:gym_buddy_tracker/routes/manage_routines.dart';

class MainTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.fitness_center), text: "Exercises"),
                Tab(icon: Icon(Icons.list), text: "Routines",),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              ManageExercises(),
              ManageRoutines(),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}