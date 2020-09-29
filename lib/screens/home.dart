import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_mate/utilities/constants.dart';
import '../screens/TaskScreen.dart';
import '../screens/NoteScreen.dart';
import '../screens/ListScreen.dart';
import 'HomeScreen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(children: [
          HomeScreen(),
          TaskScreen(),
          ListScreen(),
          NoteScreen(),
        ]),
        bottomNavigationBar: BottomAppBar(
          elevation: 5.0,
          color: kPrimaryColor,
          child: TabBar(tabs: [
            Tab(
              text: "Home",
              icon: Icon(
                CupertinoIcons.home,
              ),
            ),
            Tab(
              text: "Task",
              icon: Icon(Icons.lightbulb_outline),
            ),
            Tab(
              text: "List",
              icon: Icon(Icons.list),
            ),
            Tab(
              text: "Note",
              icon: Icon(Icons.note),
            ),
          ]),
        ),
      ),
    );
  }
}
