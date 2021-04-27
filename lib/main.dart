import 'package:flutter/material.dart';
import 'package:flutter_app/async_programming/isolate_demo.dart';
import 'package:flutter_app/state_management/home_screen.dart';
import 'package:flutter_app/stateful_stateless/statefull_widget.dart';
import 'package:flutter_app/stateful_stateless/stateless_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _buildHome(),
    );
  }

  _buildHome() {

    // 1. stateful - stateless
    // return StatelessDemoWidget(myName: 'Nguyễn Trường Vũ');
    // return StatefulDemoWidget(title: 'Flutter Demo');

    // 2.
    // return IsolateDemoWidget(title: 'Isolate demo');

    // 3. BloC
    return HomeScreen.newInstance();
  }
}