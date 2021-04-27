import 'dart:io';

import 'dart:math';

// sync
void main() async {
  final stream = randomNumbers();
  await for (var value in stream) {
    print(value);
  }
  print("Async stream!");
}

// async
// void main() {
//   final stream = randomNumbers2();
//   for (var value in stream) {
//     print(value);
//   }
//   print("Sync stream!");
// }


Stream<int> randomNumbers() async* {
  final random = Random();
  for (var i = 0; i < 100; ++i) {
    await Future.delayed(Duration(seconds: 1));
    yield random.nextInt(50) + 1;
  }
}

Iterable<int> randomNumbers2() sync* {
  final random = Random();
  for(var i = 0; i < 100; ++i) {
    sleep(Duration(seconds:1));
    yield random.nextInt(50) + 1;
  }
}
