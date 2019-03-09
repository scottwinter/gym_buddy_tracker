import 'package:flutter/material.dart';

class AddExerciseToRoutine extends StatefulWidget {
  @override
  _AddExerciseToRoutineState createState() => new _AddExerciseToRoutineState();
}

class _AddExerciseToRoutineState extends State<AddExerciseToRoutine> {
  List<String> exercises = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Exercise to Routine"),
      ),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          String exercise = exercises[index];
          return Container(
            decoration: BoxDecoration(
              border:
                  Border.all(width: 2.0, color: Theme.of(context).dividerColor),
            ),
            child: ListTile(
              title: Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 8.0),
                  child: Text(
                    exercise,
                    style: DefaultTextStyle.of(context)
                        .style
                        .apply(fontSizeFactor: 1.4),
                  )),
              subtitle: Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Upper Body | Push",
                    style: DefaultTextStyle.of(context)
                        .style
                        .apply(fontSizeFactor: 1.1),
                  )),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    exercises.add("Bench Press");
    exercises.add("Incline Dumbell Press");
    exercises.add("Dumbell Curl");
    exercises.add("Back Row");
  }
}
