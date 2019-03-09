import 'package:flutter/material.dart';
import 'package:gym_buddy_tracker/routes/manage_exercises.dart';
import 'package:gym_buddy_tracker/routes/manage_routines.dart';



class MainTabPage extends StatefulWidget {
  @override
  _MainTabPageState createState() => new _MainTabPageState();
}

class _MainTabPageState extends State<MainTabPage> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        home: DefaultTabController(
          length: 2,
          child: WillPopScope(
            onWillPop: _checkForAppExit,
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
      ),
    );
  }

  Future<bool> _checkForAppExit(){
    return showDialog(
        context: context,
        builder: (context)=>AlertDialog(
          title: Text("Do you really want to exit Gym Buddy?"),
          actions: <Widget>[
            FlatButton(
              child: Text("No"),
              onPressed: () => Navigator.pop(context, false),
            ),
            FlatButton(
              child: Text("Yes"),
              onPressed: () => Navigator.pop(context, true),
            )
          ],
        )
    );
  }
}