import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:task_mate/models/data_model.dart';
import 'package:task_mate/utilities/constants.dart';

class AddListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var listBox = Hive.box<ListModel>('lists');
    String newListItem;
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "New Item",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 25.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Title ",
                labelStyle: TextStyle(
                  color: Colors.blue[700],
                  fontWeight: FontWeight.w500,
                ),
              ),
              autofocus: true,
              style: TextStyle(
                fontSize: 20.0,
                color: kPrimaryColor,
              ),
              onChanged: (value){
                newListItem = value;
              },
            ),
            SizedBox(
              height: 25.0,
            ),
            RaisedButton.icon(
              onPressed: () {
                //Todo: do that
                if(newListItem == ''){
                  return print('-1');
                } else {
                  ListModel newItem = ListModel(itemName: newListItem);
                  listBox.add(newItem);
                  Navigator.pop(context);
                }
              },
              label: Text('add',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),),
              color: kPrimaryColor,
              icon: Icon(CupertinoIcons.add, color: Colors.white, size: 40.0, ),
              padding: EdgeInsets.all(10.0),
            ),
          ],
        ),
      ),
    );
  }
}
