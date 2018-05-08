import 'package:flutter/material.dart';
import "my_tab.dart";


class TodoApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Todo',
      theme: new ThemeData.light(),
      home: new MyTab(),
    );
  }

}
