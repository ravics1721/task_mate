import 'package:flutter/material.dart';
import '../utilities/constants.dart';

class NoteCardWidget extends StatelessWidget {

  final String name;
  final String description;
  final Function clickToDelete;

  const NoteCardWidget({@required this.name, this.description, this.clickToDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(name, style: TextStyle(
                  color: kPrimaryTextColor,
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),),
                IconButton(
                  icon: Icon(Icons.delete, color: kDisableColor,),
                  onPressed: clickToDelete,
                  highlightColor: kPrimaryColor,
                )
              ],
            ),
            Text(
              description, style: TextStyle(
              color: kPrimaryColor,
            fontSize: 17.0,
            ),
            )
          ],
        ),
      ),
      elevation: 4.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),

    );
  }
}
