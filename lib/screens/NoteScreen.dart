import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_mate/models/data_model.dart';
import 'package:task_mate/utilities/constants.dart';
import 'package:task_mate/widgets/addNoteWidget.dart';
import 'package:task_mate/widgets/note_card.dart';

class NoteScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var noteBox = Hive.box<NoteModel>('notes');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kBgColor2,
        title: Text(
          "Sticky Notes",
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 30.0,
          ),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: noteBox.listenable(),
        builder: (context, nBox, widget){
          return  ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: nBox.length,
              itemBuilder: (BuildContext ctx, int index) {
                return new NoteCardWidget(
                  name: nBox.getAt(index).name,
                  description: nBox.getAt(index).description,
                  clickToDelete: (){
                    nBox.deleteAt(index);
                  },
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(CupertinoIcons.pencil),
        label: Text('Take Note'),
        backgroundColor: kPrimaryColor,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddNoteWidget(),
              ),
            ),
          );
        },
      ),
    );
  }
}
