import 'package:flutter/material.dart';

class StatelessDemoWidget extends StatelessWidget {
  final String myName;

  StatelessDemoWidget({required this.myName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(myName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Your name:',
            ),
            Text(
              '$myName',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
