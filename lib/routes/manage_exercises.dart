import 'package:flutter/material.dart';
import 'package:gym_buddy_tracker/routes/todays_workout.dart';
import 'package:gym_buddy_tracker/routes/add_edit_exercise.dart';

class ManageExercises extends StatefulWidget {
  @override
  _ManageExercisesState createState() => new _ManageExercisesState();
}

class _ManageExercisesState extends State<ManageExercises> {
  List<String> exercises;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Exercises'),
      ),
      body: ListView.builder(
          itemCount: exercises.length,
          itemBuilder: (context, index) {
            return myCard(exercises[index]);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddEditExercise()),
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
    exerciseList.add("Incline Dumbell Press");
    exerciseList.add("Dumbell Curls");
    return exerciseList;
  }

  Widget myCard(String exercise) {
    return Card(
        elevation: 5.0,
        child: InkWell(
          onTap: () {
            // function gets executed on a tap
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
//                leading: Icon(Icons.fitness_center),
                title: Text(exercise,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                subtitle: Text('Upper Body | Push | Arms'),
                trailing: Text("2d ago"),
              ),
            ],
          ),
        ));
  }
}
