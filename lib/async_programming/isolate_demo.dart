import 'dart:io';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

class IsolateDemoWidget extends StatefulWidget {
  final String title;

  const IsolateDemoWidget({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<IsolateDemoWidget> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Stateful: build');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButton(onPressed: () {
              heavyCalculations().then((value) {
                print('$value');
                setState(() {
                  _counter = value;
                });
              });
            }, child: Text('Call compute - Isolate'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            _counter++;
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class PrimeParams {
  final int limit;
  final double another;
  const PrimeParams(this.limit, this.another);
}
// Use the model as parameter
Future<int> sumOfPrimes(PrimeParams data) async {
  final limit = data.limit;
  final another = data.another;
  await Future.delayed(Duration(seconds: 5));
  return (limit * another).floor();
}

// Function to be called in Flutter
Future<int> heavyCalculations() {
  final params = PrimeParams(50000, 10.5);
  return compute<PrimeParams, int>(sumOfPrimes, params);
}