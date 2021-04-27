import 'package:flutter/material.dart';

class StatefulDemoWidget2 extends StatefulWidget {
  final String title;

  const StatefulDemoWidget2({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState2 createState() => _MyHomePageState2();
}

class _MyHomePageState2 extends State<StatefulDemoWidget2> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    print('Stateful2: initState');
    if (mounted) {
    } else {
      // state called dispose
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('Stateful2: didChangeDependencies');
  }

  // • calling setState,
  // • rotating the screen of the device,
  // • awaiting the result of a future,
  // • listening to incoming stream events.
  @override
  Widget build(BuildContext context) {
    print('Stateful2: build');
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
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Scaffold(
                        appBar: AppBar(
                          title: Text('New Screen'),
                        ),
                        body: Container(),
                      )));
                },
                child: const Text(
                  'New screen',
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            _counter++;
          });
          await writeToFile(_counter);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void didUpdateWidget(StatefulDemoWidget2 oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('Stateful2: didUpdateWidget');
  }

  @override
  void dispose() {
    print('Stateful2: dispose');
    super.dispose();
  }

  writeToFile(int counter) async {
    // write to file
  }
}
