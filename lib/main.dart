import 'dart:async';

import 'package:flutter/material.dart';

final streamController = StreamController<String>();

void main() {
  ///Future
  task1();
  task2();
  task3();
  ///Stream①
  streamController.stream.listen((addData) {
    debugPrint(addData);
  });

  //データを追加する
  streamController.sink.add('赤');
  streamController.sink.add('青');
  streamController.sink.add('黄');

  ///Stream②
  // numberStreamからデータを受け取るリスナーを登録
  Stream<int> stream = numberStream();
  stream.listen((data) {
    print('task$data');
  }, onError: (error) {
    print('Error: $error');
  }, onDone: () {
    print('All tasks completed');
  });
}

void task1() => debugPrint('task1 complete');

//2秒後にPrintされる
Future<void> task2() async {
  Future<String> future = Future.delayed(const Duration(seconds: 2), () => 'task2 complete');
  String value =  await future;
  debugPrint(value);
}

void task3() => debugPrint('task3 complete');

// 1秒ごとに整数を生成するStreamを作成する関数
Stream<int> numberStream() async* {
  int counter = 1;
  while (counter < 6) {
    await Future.delayed(const Duration(seconds: 1));
    yield counter++;
  }
}