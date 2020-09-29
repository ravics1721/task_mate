import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:task_mate/models/data_model.dart';
import 'package:task_mate/utilities/constants.dart';

class AddNoteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var noteBox = Hive.box<NoteModel>('notes');
    String newNoteTitle;
    String newNoteDescription;
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
              "New Note",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 25.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Title ",
                hintStyle: TextStyle(
                  color: Colors.blueGrey[500],
                  fontWeight: FontWeight.w500,
                ),
              ),
              autofocus: true,
              style: TextStyle(
                fontSize: 20.0,
                color: kPrimaryColor,
              ),
              onChanged: (value) {
                newNoteTitle = value;
              },
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Description ",
                hintStyle: TextStyle(
                  color: Colors.blueGrey[500],
                  fontWeight: FontWeight.normal,
                ),
                hintMaxLines: 10,
              ),
              minLines: 2,
              maxLines: 5,
              autofocus: true,
              style: TextStyle(
                fontSize: 20.0,
                color: kPrimaryColor,
              ),
              onChanged: (value) {
                newNoteDescription = value;
              },
            ),
            SizedBox(
              height: 25.0,
            ),
            RaisedButton.icon(
              onPressed: () {
                //Todo: do that
                NoteModel newNote = NoteModel(
                    name: newNoteTitle, description: newNoteDescription);
                noteBox.add(newNote);
                print(noteBox.getAt(noteBox.length - 1).name);
                Navigator.pop(context);
              },
              label: Text(
                'Note',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
              color: kPrimaryColor,
              icon: Icon(
                CupertinoIcons.add,
                color: Colors.white,
                size: 40.0,
              ),
              padding: EdgeInsets.all(10.0),
            ),
//            RaisedButton(
//              onPressed: () {
//                print('hello');
//              },
//              child: Text(
//                'Add ',
//                style: TextStyle(
//                  color: Colors.white,
//                  fontSize: 30.0,
//                ),
//              ),
//              padding: EdgeInsets.all(10.0),
//              color: kPrimaryColor,
//              elevation: 5,
//            ),
          ],
        ),
      ),
    );
  }
}
