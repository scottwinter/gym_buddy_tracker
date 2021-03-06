import 'package:flutter/material.dart';
import 'package:flutter_tagging/flutter_tagging.dart';

class AddEditExercise extends StatefulWidget {
  final String action;

  AddEditExercise(this.action);

  @override
  _AddEditExerciseState createState() => new _AddEditExerciseState(action);
}

class _AddEditExerciseState extends State<AddEditExercise> {
  final String action;

  _AddEditExerciseState(this.action);

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<dynamic> categoryList = <dynamic>[];

  @override
  Widget build(BuildContext context) {
    String label = "";
    String title = "";
    if (action == "add") {
      label = "Add";
      title = "Create New Exercise";
    } else {
      label = "Update";
      title = "Update Exercise";
    }

    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
          padding: new EdgeInsets.all(20.0),
          child: new Form(
            key: this._formKey,
            child: new ListView(
              children: <Widget>[
                new TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    // Use email input type for emails.
                    decoration: new InputDecoration(
                        hintText: 'Bench Press', labelText: 'Exercise Name')),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                  child: FlutterTagging(
                    textFieldDecoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Category",
                        labelText: "Enter Categories"),
                    addButtonWidget: _buildAddButton(),
                    chipsColor: Colors.orange,
                    chipsFontColor: Colors.white,
                    deleteIcon: Icon(Icons.cancel, color: Colors.white),
                    chipsPadding: EdgeInsets.all(2.0),
                    chipsFontSize: 16.0,
                    chipsSpacing: 5.0,
                    chipsFontFamily: 'helvetica_neue_light',
                    suggestionsCallback: (pattern) async {
                      return await TagSearchService.getSuggestions(pattern);
                    },
                    onChanged: (result) {
                      setState(() {
                        categoryList = result;
                      });
                    },
                  ),
                ),
                new Container(
                  width: screenSize.width,
                  child: new RaisedButton(
                    child: new Text(
                      label,
                      style: new TextStyle(color: Colors.white),
                    ),
                    onPressed: () => _saveExercise(),
                    color: Colors.blue,
                  ),
                  margin: new EdgeInsets.only(top: 20.0),
                )
              ],
            ),
          )),
    );
  }

  _saveExercise() {
    print("----------------------------" + categoryList.toString());
  }

  Widget _buildAddButton() {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Colors.pinkAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            Icons.add,
            color: Colors.white,
            size: 15.0,
          ),
          Text(
            "Add New Tag",
            style: TextStyle(color: Colors.white, fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}

class TagSearchService {
  static Future<List> getSuggestions(String query) async {
    await Future.delayed(Duration(milliseconds: 400), null);
    List<dynamic> tagList = <dynamic>[];
    tagList.add({'name': "Upper Body", 'value': 1});
    tagList.add({'name': "Lower Body", 'value': 2});
    tagList.add({'name': "Push", 'value': 3});
    tagList.add({'name': "Pull", 'value': 4});
    tagList.add({'name': "Arms", 'value': 5});
    tagList.add({'name': "Legs", 'value': 6});
    tagList.add({'name': "Core", 'value': 7});
    List<dynamic> filteredTagList = <dynamic>[];
    if (query.isNotEmpty) {
      filteredTagList.add({'name': query, 'value': 0});
    }
    for (var tag in tagList) {
      if (tag['name'].toLowerCase().contains(query)) {
        filteredTagList.add(tag);
      }
    }
    return filteredTagList;
  }
}
