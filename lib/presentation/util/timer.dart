import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';

class CountdownTimer extends StatefulWidget {
  final int seconds;
  final TextStyle textStyle;

  // ignore: use_super_parameters
  const CountdownTimer({
    Key? key,
    required this.seconds,
    required this.textStyle,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late int remainingSeconds;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    remainingSeconds = widget.seconds; // Set initial time
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Duration duration = Duration(seconds: remainingSeconds);
    String timerText =
        "${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}";

    return Text(
      timerText,
      style: widget.textStyle,
    );
  }

  @override
  void dispose() {
    timer.cancel(); // Cancel timer when the widget is disposed
    super.dispose();
  }
}

int generateRandomTime() {
  Random random = Random();
  // Generate a random number between 3 hours (10800 seconds) and 5 hours (18000 seconds)
  int randomTimeInSeconds = random.nextInt(7200) + 10800; // Between 10800 to 18000 seconds
  return randomTimeInSeconds;
}

