import 'package:flutter/material.dart';
import 'package:gym_buddy_tracker/routes/manage_exercises.dart';
import 'package:gym_buddy_tracker/routes/manage_routines.dart';

class MainTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: "Exercises"),// icon: Icon(Icons.fitness_center),
                Tab(text: "Routines"),// icon: Icon(Icons.list),
            ],
            ),
            title: Text('Gym Buddy'),
          ),
          body: TabBarView(
            children: [
              ManageExercises(),
              ManageRoutines(),
            ],
          ),
        ),
      ),
    );
  }
}