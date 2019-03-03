import 'package:flutter/material.dart';
import 'package:gym_buddy_tracker/routes/add_edit_exercise.dart';
import 'package:gym_buddy_tracker/routes/add_exercise_to_routine.dart';

class BuildRoutine extends StatefulWidget {
  @override
  _BuildRoutineState createState() => new _BuildRoutineState();
}

class _BuildRoutineState extends State<BuildRoutine> {
  List<String> exercises;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Leg Day"),
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
            MaterialPageRoute(builder: (context) => AddExerciseToRoutine()),
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
          onTap: () {},
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
//                leading: Icon(Icons.fitness_center),
                title: Text(exercise,
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
//                subtitle: Text('Upper Body | Push | Arms'),
              ),
            ],
          ),
        ));
  }
}
