import 'dart:io';

void main() {
  print('${DateTime.now().toIso8601String()} init');

  // v1
  // processData(2,3);
  print('result: ${processData(2,3)}');

  // v2
  final fProcessData = processData2(2,3);
  fProcessData.then((value) {
    print('result: ${value}');
  }).catchError((e) {

  });

  print('${DateTime.now().toIso8601String()} done');
}

int processData(int a, int b) {
  sleep(Duration(seconds: 5));
  return a + b;
}

Future<int> processData2(int a, int b) async {
  await Future.delayed(Duration(seconds: 5));
  return a + b;
}

Future<int> processDataWithoutAsyncAwait(int a, int b) {

  return Future<int>.delayed(Duration(seconds: 5), () => a + b);

  // Future<int>.value(a + b);
  //
  // Future<int>.error('Fail');
  //
  // return Future<int>.error('Fail');
}