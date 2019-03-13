import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_reorderable_list/flutter_reorderable_list.dart';
// Routes
import 'package:gym_buddy_tracker/routes/add_exercise_to_routine.dart';

class BuildRoutine extends StatefulWidget {
  @override
  _BuildRoutineState createState() => new _BuildRoutineState();
}

class ItemData {
  ItemData(this.title, this.key);

  final String title;

  // Each item in reorderable list needs stable and unique key
  final Key key;
}

enum DraggingMode {
  iOS,
  Android,
}

class _BuildRoutineState extends State<BuildRoutine> {

  List<ItemData> _items;
  _BuildRoutineState() {
    _items = List();
//    for (int i = 0; i < 500; ++i) {
//      String label = "List item $i";
//      if (i == 5) {
//        label += ". This item has a long label and will be wrapped.";
//      }
//      _items.add(ItemData(label, ValueKey(i)));
//    }

    _items.add(ItemData("Incline Dumbell Press", ValueKey(0)));
    _items.add(ItemData("Dumbell Curls", ValueKey(1)));

  }


  List<String> exercises;

  // Returns index of item with given key
  int _indexOfKey(Key key) {
    return _items.indexWhere((ItemData d) => d.key == key);
  }

  bool _reorderCallback(Key item, Key newPosition) {
    int draggingIndex = _indexOfKey(item);
    int newPositionIndex = _indexOfKey(newPosition);

    // Uncomment to allow only even target reorder possition
    // if (newPositionIndex % 2 == 1)
    //   return false;

    final draggedItem = _items[draggingIndex];
    setState(() {
      debugPrint("Reordering $item -> $newPosition");
      _items.removeAt(draggingIndex);
      _items.insert(newPositionIndex, draggedItem);
    });
    return true;
  }

  void _reorderDone(Key item) {
    final draggedItem = _items[_indexOfKey(item)];
    debugPrint("Reordering finished for ${draggedItem.title}}");
  }

  //
  // Reordering works by having ReorderableList widget in hierarchy
  // containing ReorderableItems widgets
  //

  DraggingMode _draggingMode = DraggingMode.Android;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Leg Day"),
      ),
      body: ReorderableList(
        onReorder: this._reorderCallback,
        onReorderDone: this._reorderDone,
        child: CustomScrollView(
          // cacheExtent: 3000,
          slivers: <Widget>[
//            SliverAppBar(
//              actions: <Widget>[
//                PopupMenuButton<DraggingMode>(
//                  child: Container(
//                    alignment: Alignment.center,
//                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
//                    child: Text("Options"),
//                  ),
//                  initialValue: _draggingMode,
//                  onSelected: (DraggingMode mode) {
//                    setState(() {
//                      _draggingMode = mode;
//                    });
//                  },
//                  itemBuilder: (BuildContext context) =>
//                  <PopupMenuItem<DraggingMode>>[
//                    const PopupMenuItem<DraggingMode>(
//                        value: DraggingMode.iOS,
//                        child: Text('iOS-like dragging')),
//                    const PopupMenuItem<DraggingMode>(
//                        value: DraggingMode.Android,
//                        child: Text('Android-like dragging')),
//                  ],
//                ),
//              ],
////              pinned: true,
////              expandedHeight: 150.0,
////              flexibleSpace: const FlexibleSpaceBar(
////                title: const Text('Demo'),
////              ),
//            ),
            SliverPadding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Item(
                        data: _items[index],
                        // first and last attributes affect border drawn during dragging
                        isFirst: index == 0,
                        isLast: index == _items.length - 1,
                        draggingMode: _draggingMode,
                      );
                    },
                    childCount: _items.length,
                  ),
                )),
          ],
        ),
      ),
    );
  }



//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Edit Leg Day"),
//      ),
//      body: ListView.builder(
//          itemCount: exercises.length,
//          itemBuilder: (context, index) {
//            return myCard(exercises[index]);
//          }),
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {
//          Navigator.push(
//            context,
//            MaterialPageRoute(builder: (context) => AddExerciseToRoutine()),
//          );
//        },
//        child: Icon(Icons.add),
//      ),
//    );
//  }
//
//  initState() {
//    super.initState();
//    exercises = createWorkout();
//  }
//
//  List<String> createWorkout() {
//    List<String> exerciseList = new List();
//    exerciseList.add("Incline Dumbell Press");
//    exerciseList.add("Dumbell Curls");
//    return exerciseList;
//  }
//
//  Widget myCard(String exercise) {
//    return Card(
//        elevation: 5.0,
//        child: InkWell(
//          onTap: () {},
//          child: Column(
//            mainAxisSize: MainAxisSize.min,
//            children: <Widget>[
//              ListTile(
////                leading: Icon(Icons.fitness_center),
//                title: Text(exercise,
//                    style:
//                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
////                subtitle: Text('Upper Body | Push | Arms'),
//              ),
//            ],
//          ),
//        ));
//  }
}

class Item extends StatelessWidget {
  Item({
    this.data,
    this.isFirst,
    this.isLast,
    this.draggingMode,
  });

  final ItemData data;
  final bool isFirst;
  final bool isLast;
  final DraggingMode draggingMode;

  Widget _buildChild(BuildContext context, ReorderableItemState state) {
    BoxDecoration decoration;

    if (state == ReorderableItemState.dragProxy ||
        state == ReorderableItemState.dragProxyFinished) {
      // slightly transparent background white dragging (just like on iOS)
      decoration = BoxDecoration(color: Color(0xD0FFFFFF));
    } else {
      bool placeholder = state == ReorderableItemState.placeholder;
      decoration = BoxDecoration(
          border: Border(
              top: isFirst && !placeholder
                  ? Divider.createBorderSide(context) //
                  : BorderSide.none,
              bottom: isLast && placeholder
                  ? BorderSide.none //
                  : Divider.createBorderSide(context)),
          color: placeholder ? null : Colors.white);
    }

    // For iOS dragging mdoe, there will be drag handle on the right that triggers
    // reordering; For android mode it will be just an empty container
    Widget dragHandle = draggingMode == DraggingMode.iOS
        ? ReorderableListener(
      child: Container(
        padding: EdgeInsets.only(right: 18.0, left: 18.0),
        color: Color(0x08000000),
        child: Center(
          child: Icon(Icons.reorder, color: Color(0xFF888888)),
        ),
      ),
    )
        : Container();

    Widget content = Container(
      decoration: decoration,
      child: SafeArea(
          top: false,
          bottom: false,
          child: Opacity(
            // hide content for placeholder
            opacity: state == ReorderableItemState.placeholder ? 0.0 : 1.0,
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
                        child: Text(data.title,
                            style: Theme.of(context).textTheme.subhead),
                      )),
                  // Triggers the reordering
                  dragHandle,
                ],
              ),
            ),
          )),
    );

    // For android dragging mode, wrap the entire content in DelayedReorderableListener
    if (draggingMode == DraggingMode.Android) {
      content = DelayedReorderableListener(
        child: content,
      );
    }

    return content;
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableItem(
        key: data.key, //
        childBuilder: _buildChild);
  }
}
