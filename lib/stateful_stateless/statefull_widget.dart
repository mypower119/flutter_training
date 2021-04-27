import 'package:flutter/material.dart';
import 'package:flutter_app/stateful_stateless/statefull_widget2.dart';

class StatefulDemoWidget extends StatefulWidget {
  final String title;

  const StatefulDemoWidget({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<StatefulDemoWidget> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    print('Stateful: initState');
    if (mounted) {
      //dfdffdfd
    } else {
      // state called dispose
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('Stateful: didChangeDependencies');
  }

  // • calling setState,
  // • rotating the screen of the device,
  // • awaiting the result of a future,
  // • listening to incoming stream events.
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
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => StatefulDemoWidget2(title: 'screen 2',)));
                },
                child: const Text(
                  'New screen',
                )),
            buildContainer()
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
  void didUpdateWidget(StatefulDemoWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('Stateful: didUpdateWidget');
  }

  @override
  void dispose() {
    print('Stateful: dispose');
    super.dispose();
  }

  writeToFile(int counter) async {
    // write to file
  }


}

buildContainer() {
  return Container(
    width: 200,
    height: 200,
    child: StatefulDemoWidget2(title: 'screen 2',),
  );
}

class BuildContainerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: StatefulDemoWidget2(title: 'screen 2',),
    );
  }

  const BuildContainerWidget();
}
