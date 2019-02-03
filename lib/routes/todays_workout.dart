import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> exercises;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Gym Buddy'),
        ),
        body: ListView.builder(
            itemCount: exercises.length,
            itemBuilder: (context, index) {
              return myCard(exercises[index]);
            }));
  }

  initState() {
    super.initState();
    exercises = createWorkout();
  }

  List<String> createWorkout() {

    List<String> exerciseList = new List();
    exerciseList.add("Bench Press");
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
                leading: Icon(Icons.fitness_center),
                title: Text(exercise,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                subtitle: Text('Upper Body'),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Row(
                              children: <Widget>[
                                Text("Set",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16))
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Row(
                              children: <Widget>[
                                Text("Weight",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16))
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Row(
                              children: <Widget>[
                                Text("Reps",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(
                                color: Theme.of(context).dividerColor)),
                      ),
                      padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Row(
                              children: <Widget>[
                                Text("Previous",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16))
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Row(
                              children: <Widget>[
                                Text("135 lbs", style: TextStyle(fontSize: 16))
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Row(
                              children: <Widget>[
                                Text("10", style: TextStyle(fontSize: 16))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Row(
                              children: <Widget>[
                                Text("Set 1",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16))
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Row(
                              children: <Widget>[
                                Text("140 lbs", style: TextStyle(fontSize: 16))
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Row(
                              children: <Widget>[
                                Text("10", style: TextStyle(fontSize: 16))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Row(
                              children: <Widget>[
                                Text("Set 2",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16))
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Row(
                              children: <Widget>[
                                Text("140 lbs", style: TextStyle(fontSize: 16))
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Row(
                              children: <Widget>[
                                Text("10", style: TextStyle(fontSize: 16))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Row(
                              children: <Widget>[
                                Text("Set 3",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16))
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Row(
                              children: <Widget>[
                                Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1.0,
                                              color: Color(0xFFFF000000))),
                                    ),
                                    child: Text("             ",
                                        style: TextStyle(fontSize: 16)))
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Row(
                              children: <Widget>[
                                Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1.0,
                                              color: Color(0xFFFF000000))),
                                    ),
                                    child: Text("             ",
                                        style: TextStyle(fontSize: 16)))
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
