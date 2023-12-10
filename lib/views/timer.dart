import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

///
/// Test app
///

class MyHomePage extends StatefulWidget {
  ///
  /// AppBar title
  ///
  final String title;

  /// Home page
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

///
/// Page state
///
class _MyHomePageState extends State<MyHomePage> {
  // Controller
  final CountdownController _controller = CountdownController(autoStart: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // Start
                  ElevatedButton(
                    child: const Text('Start'),
                    onPressed: () {
                      _controller.start();
                    },
                  ),
                  // Pause
                  ElevatedButton(
                    child: const Text('Pause'),
                    onPressed: () {
                      _controller.pause();
                    },
                  ),
                  // Resume
                  ElevatedButton(
                    child: const Text('Resume'),
                    onPressed: () {
                      _controller.resume();
                    },
                  ),
                  // Stop
                  ElevatedButton(
                    child: const Text('Restart'),
                    onPressed: () {
                      _controller.restart();
                    },
                  ),
                ],
              ),
            ),
            Countdown(
              // controller: _controller,
              seconds: 5,
              build: (_, double time) => Text(
                time.toString(),
                style: const TextStyle(
                  fontSize: 100,
                ),
              ),
              interval: const Duration(milliseconds: 100),
              onFinished: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Timer is done!'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
