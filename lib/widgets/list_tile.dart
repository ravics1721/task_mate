import 'package:flutter/material.dart';
import '../utilities/constants.dart';

class ListTileWidget extends StatelessWidget {
  final String itemName;
  final bool isDone;
  final Function checkBoxCallback;
  final Function longPressCallback;
  ListTileWidget(
      {@required this.itemName,
      this.isDone,
      this.checkBoxCallback,
      this.longPressCallback});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        '${itemName}',
        style: TextStyle(
          color: isDone ? kDisableColor : kPrimaryColor,
          decoration: isDone ? TextDecoration.lineThrough : null,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Checkbox(
        value: isDone,
        onChanged: checkBoxCallback,
        activeColor: kPrimaryColor,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}
