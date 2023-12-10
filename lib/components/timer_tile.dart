import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';

class CountDowm extends StatelessWidget {
  const CountDowm({super.key});

  @override
  Widget build(BuildContext context) {
    return Countdown(
      seconds: 60,
      build: (BuildContext context, double time) => Text(time.toString()),
      interval: const Duration(milliseconds: 100),
      onFinished: () {
        print('Timer is done!');
      },
    );
  }
}
