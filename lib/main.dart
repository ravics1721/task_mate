import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_mate/models/data_model.dart';
import 'utilities/constants.dart';
import 'screens/home.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //app document path
  Directory document = await pathProvider.getApplicationDocumentsDirectory();
  //hive initialization
  await Hive.initFlutter(document.path);
  // register adaptor
  Hive.registerAdapter(TaskModelAdapter());
  Hive.registerAdapter(ListModelAdapter());
  Hive.registerAdapter(NoteModelAdapter());
  //open all boxes
  await Hive.openBox<TaskModel>('tasks');
  await Hive.openBox<ListModel>('lists');
  await Hive.openBox<NoteModel>('notes');
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: kBgColor2,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => Home(),
      },
    );
  }
}
