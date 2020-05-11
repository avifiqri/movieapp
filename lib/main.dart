import 'package:flutter/material.dart';

import 'mylistapp.dart';

void main() => runApp(new MaterialApp(
      home: MyApp(),
      theme: ThemeData(
        primaryColor: Colors.lightGreenAccent,      ),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MovieList(
      
    );
  }
}