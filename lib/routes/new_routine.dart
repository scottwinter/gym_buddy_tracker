import 'package:flutter/material.dart';
import 'package:gym_buddy_tracker/routes/build_routine.dart';

class AddEditRoutine extends StatefulWidget {
  @override
  _AddEditRoutineState createState() => new _AddEditRoutineState();
}

class _AddEditRoutineState extends State<AddEditRoutine> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Routine'),
      ),
      body: Container(
          padding: new EdgeInsets.all(20.0),
          child: new Form(
            key: this._formKey,
            child: new ListView(
              children: <Widget>[
                TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                        hintText: 'Leg Day', labelText: 'Routine Name')),
                Container(
                  width: screenSize.width,
                  child: new RaisedButton(
                    child: new Text(
                      'Create',
                      style: new TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BuildRoutine()),
                      );
                    },
                    color: Colors.blue,
                  ),
                  margin: new EdgeInsets.only(top: 20.0),
                )
              ],
            ),
          )),
    );
  }
}
