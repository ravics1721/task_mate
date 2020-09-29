import 'package:hive/hive.dart';
part 'data_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject{
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String details;
  @HiveField(2)
  final bool isDone;

  TaskModel({this.title, this.details, this.isDone = false});
}

@HiveType(typeId: 1)
class ListModel extends HiveObject{
  @HiveField(0)
  final String itemName;
  @HiveField(1)
  final bool isDone;
  ListModel({this.itemName, this.isDone = false});
}

@HiveType(typeId: 2)
class NoteModel{
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String description;
  NoteModel({this.name, this.description});
}