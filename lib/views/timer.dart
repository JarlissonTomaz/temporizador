import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class UserTimer extends StatefulWidget {
  const UserTimer({super.key});

  @override
  State<UserTimer> createState() => _UserTimerState();
}

class _UserTimerState extends State<UserTimer> {
  final int _duration = 10;
  final CountDownController _controller = CountDownController();
  var isPlaying = false;
  var isPlay = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Clock',
        ),
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                    const PopupMenuItem(
                      child: Text('Editar nome/Brinquedo'),
                    ),
                    const PopupMenuItem(
                      child: Text('Editar Tempo'),
                    ),
                  ])
        ],
        backgroundColor: const Color.fromRGBO(130, 182, 198, 1),
        shadowColor: Colors.transparent,
      ),
      backgroundColor: const Color.fromRGBO(130, 182, 198, 1),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 80.0),
        child: Center(
          child: CircularCountDownTimer(
            // Countdown duration in Seconds.
            duration: _duration,

            // Countdown initial elapsed Duration in Seconds.
            initialDuration: 0,
            // Controls (i.e Start, Pause, R9i0o-p[
            //esume, Restart) the Countdown Timer.
            controller: _controller,

            // Width of the Countdown Widget.
            width: MediaQuery.of(context).size.width / 2,

            // Height of the Countdown Widget.
            height: MediaQuery.of(context).size.height / 2,

            // Ring Color for Countdown Widget.
            ringColor: const Color.fromRGBO(12, 125, 160, 1),

            // Ring Gradient for Countdown Widget.
            ringGradient: null,

            // Filling Color for Countdown Widget.
            fillColor: const Color.fromRGBO(138, 185, 199, 1),

            // Filling Gradient for Countdown Widget.
            fillGradient: null,

            // Background Color for Countdown Widget.
            backgroundColor: const Color.fromRGBO(130, 182, 198, 1),

            // Background Gradient for Countdown Widget.
            backgroundGradient: null,

            // Border Thickness of the Countdown Ring.
            strokeWidth: 20.0,

            // Begin and end contours with a flat edge and no extension.
            strokeCap: StrokeCap.round,

            // Text Style for Countdown Text.
            textStyle: const TextStyle(
              fontSize: 50.0,
              color: Color.fromRGBO(32, 133, 165, 1),
              fontWeight: FontWeight.w900,
            ),

            // Format for the Countdown Text.
            textFormat: CountdownTextFormat.MM_SS,

            // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
            isReverse: true,

            // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
            isReverseAnimation: false,

            // Handles visibility of the Countdown Text.
            isTimerTextShown: true,

            // Handles the timer start.
            autoStart: true,

            // This Callback will execute when the Countdown Starts.
            onStart: () {
              // Here, do whatever you want
              debugPrint('Countdown Started');
            },

            // This Callback will execute when the Countdown Ends.
            onComplete: () {
              // Here, do whatever you want
              debugPrint('Countdown Ended');
              isPlay = true;
            },

            // This Callback will execute when the Countdown Changes.
            onChange: (String timeStamp) {
              // Here, do whatever you want
              debugPrint('Countdown Changed $timeStamp');
            },

            /* 
              * Function to format the text.
              * Allows you to format the current duration to any String.
              * It also provides the default function in case you want to format specific moments
                as in reverse when reaching '0' show 'GO', and for the rest of the instances follow 
                the default behavior.
            */
            timeFormatterFunction: (defaultFormatterFunction, duration) {
              if (duration.inSeconds == 0) {
                // only format for '0'
                return "Start";
              } else {
                // other durations by it's default format
                return Function.apply(defaultFormatterFunction, [duration]);
              }
            },
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 30,
            ),
            IconButton(
                onPressed: () {
                  _controller.reset();
                },
                icon: const Icon(
                  Icons.autorenew,
                  size: 40,
                  color: Colors.white,
                  shadows: [
                    BoxShadow(
                      color: Color.fromARGB(75, 0, 0, 0),
                      offset: Offset(0, 2),
                      blurRadius: 20,
                    )
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(
                right: 60,
                top: 10,
                left: 60,
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isPlay ? _controller.start() : _controller.resume();

                    isPlaying ? _controller.resume() : _controller.pause();

                    isPlaying = !isPlaying;

                    isPlay = false;
                  });
                },
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(12, 125, 160, 0.2),
                  ),
                  child: isPlaying
                      ? const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 50,
                        )
                      : const Icon(
                          Icons.pause,
                          color: Colors.white,
                          size: 50,
                        ),
                ),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                  size: 40,
                  color: Color.fromARGB(255, 255, 255, 255),
                  shadows: [
                    BoxShadow(
                      color: Color.fromARGB(75, 0, 0, 0),
                      offset: Offset(0, 2),
                      blurRadius: 20,
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
