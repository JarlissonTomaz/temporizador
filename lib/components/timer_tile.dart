import 'package:flutter/material.dart';

import 'package:timer_count_down/timer_count_down.dart';

class CountDowm extends StatefulWidget {
  const CountDowm({super.key});
  @override
  State<CountDowm> createState() => _CountDowmState();
}

class _CountDowmState extends State<CountDowm> {
  @override
  Widget build(BuildContext context) {
// ...
    return Countdown(
      seconds: 10,
      build: (BuildContext context, double time) => Text(time.toString()),
      interval: const Duration(milliseconds: 100),
      onFinished: () {
        setState(() {});
      },
    );
  }
}
