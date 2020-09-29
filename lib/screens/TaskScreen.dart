import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_mate/models/data_model.dart';
import 'package:task_mate/widgets/task_tile.dart';
import '../utilities/constants.dart';
import '../widgets/addTaskWidget.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var taskBox = Hive.box<TaskModel>('tasks');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBgColor,
        centerTitle: true,
        title: Text(
          "All Tasks",
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 30.0,
          ),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: taskBox.listenable(),
        builder: (context, tBox, widget) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: tBox.length,
              itemBuilder: (BuildContext ctx, int index) {
                var task = tBox.getAt(index);
                return new Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TaskTileWidget(
                          title: task.title,
                          details: task.details,
                          isDone: task.isDone,
                          checkBoxCallback: () {
                            taskBox.putAt(
                                index,
                                TaskModel(
                                    title: task.title,
                                    details: task.details,
                                    isDone: !task.isDone));
                          },
                          onLongPressCallback: () {
                            tBox.deleteAt(index);
                          },
                        ),
                      ],
                    ),
                  ),
                  color: Colors.white,
                  elevation: 5.0,
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: kPrimaryColor,
          icon: Icon(CupertinoIcons.add),
          label: Text("New"),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTaskWidget(),
                ),
              ),
            );
          }),
    );
  }
}
