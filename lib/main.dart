import 'package:flutter/material.dart';

void main() {
  task1();
  task2();
  task3();
}

void task1() => debugPrint('task1 complete');

Future<void> task2() async {
  Future<String> future = Future.delayed(const Duration(seconds: 2), () => 'task2 complete');
  String value =  await future;
  debugPrint(value);
}

void task3() => debugPrint('task3 complete');