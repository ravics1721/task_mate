import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:task_mate/models/data_model.dart';
import '../widgets/boxcard.dart';
import '../utilities/constants.dart';

var taskBox = Hive.box<TaskModel>('tasks');
var listBox = Hive.box<ListModel>('lists');
var noteBox = Hive.box<NoteModel>('notes');

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "TaskMate",
              style: TextStyle(
                color: kPrimaryTextColor,
              ),
            ),
            IconButton(
                icon: Icon(
                  Icons.settings,
                  size: 30.0,
                  color: kPrimaryColor,
                ),
                onPressed: null),
          ],
        ),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            size: 30.0,
            color: kPrimaryColor,
          ),
          onPressed: null,
        ),
        elevation: 0,
        backgroundColor: kBgColor2,
      ),
      body: Column(
        children: <Widget>[
          User(),
          BoxCard(
            title: "List",
            items: [
              "${listBox.length} All",
              "0 done",
              "0 left",
            ],
          ),
          BoxCard(
            title: "Task",
            items: [
              "${taskBox.length} All",
              "0 done",
              "0 left",
            ],
          ),
          BoxCard(
            title: "Note",
            items: [
              "${noteBox.length} All",
              " ",
              " ",
            ],
          ),
        ],
      ),
    );
  }
}

class User extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              top: 10.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Hello Ravi!",
                  style: TextStyle(
                    color: kSecondaryTextColor,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
