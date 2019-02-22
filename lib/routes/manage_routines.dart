import 'package:flutter/material.dart';
import 'package:gym_buddy_tracker/routes/add_edit_routine.dart';
import 'package:gym_buddy_tracker/routes/todays_workout.dart';

class ManageRoutines extends StatefulWidget {
  @override
  _ManageRoutinesState createState() => new _ManageRoutinesState();
}

class _ManageRoutinesState extends State<ManageRoutines> {
  List<String> exercises;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text('Manage Routines'),
//      ),
      body: ListView.builder(
          itemCount: exercises.length,
          itemBuilder: (context, index) {
            return myCard(exercises[index]);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddEditRoutine()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  initState() {
    super.initState();
    exercises = createWorkout();
  }

  List<String> createWorkout() {
    List<String> exerciseList = new List();
    exerciseList.add("Leg Day");
    exerciseList.add("Upper Body Day");
    return exerciseList;
  }

  Widget myCard(String exercise) {
    return Card(
        elevation: 5.0,
        child: InkWell(
          onTap: () {
            // function gets executed on a tap
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TodayWorkout()),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
//                leading: Icon(Icons.fitness_center),
                title: Text(exercise,
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                subtitle: Text('Monday | Wednesday'),
                trailing: Text("2d ago"),
              ),
            ],
          ),
        ));
  }
}
