import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:task_mate/models/data_model.dart';
import 'package:task_mate/utilities/constants.dart';
import 'package:task_mate/widgets/list_tile.dart';
import '../widgets/addListWidget.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var listBox = Hive.box<ListModel>('lists');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "All Lists",
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 30.0,
          ),
        ),
        backgroundColor: kBgColor2,
      ),
      body: ValueListenableBuilder(
        valueListenable: listBox.listenable(),
        builder: (context, box, widget) {
          return ListView.builder(
              itemCount: box.length,
              itemBuilder: (BuildContext ctx, int index) {
                return new Container(
                  margin: EdgeInsets.only(
                      top: 10.0, bottom: 2.0, right: 10.0, left: 10.0),
                  padding: EdgeInsets.only(left: 10.0),
                  child: ListTileWidget(
                    itemName: box.getAt(index).itemName,
                    isDone: box.getAt(index).isDone,
                    checkBoxCallback: (value) {
                      box.putAt(
                          index,
                          ListModel(
                              itemName: box.getAt(index).itemName,
                              isDone: value));
                    },
                    longPressCallback: () {
                      box.deleteAt(index);
                    },
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5.0,
                          spreadRadius: 3.0,
                          color: Colors.grey.withOpacity(0.5),
                          offset: Offset(0, 3),
                        ),
                      ]),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          label: Text("Item"),
          icon: Icon(CupertinoIcons.add),
          backgroundColor: kPrimaryColor,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              elevation: 5,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddListWidget(),
                ),
              ),
            );
          }),
    );
  }
}
