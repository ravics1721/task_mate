import 'package:flutter/material.dart';
import '../utilities/constants.dart';

class TaskTileWidget extends StatelessWidget {
  final String title;
  final String details;
  final bool isDone;
  final Function checkBoxCallback;
  final Function onLongPressCallback;

  const TaskTileWidget(
      {@required this.title,
      this.details,
      this.isDone,
      this.checkBoxCallback,
      this.onLongPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: isDone ? kDisableColor : kPrimaryTextColor,
          decoration: isDone ? TextDecoration.lineThrough : null,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: Text(
        details,
        style: TextStyle(
          color: isDone ? kDisableColor : kPrimaryColor,
          fontSize: 17.0,
        ),
        maxLines: 5,
      ),
    leading: IconButton(
      icon: Icon(Icons.beenhere),
      iconSize: 35.0,
      color: isDone ?  kPrimaryColor : kDisableColor,
      onPressed: checkBoxCallback,
    ),
      isThreeLine: true,
      onLongPress: onLongPressCallback,
    );
  }
}
