import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';

class CountdownTimer extends StatefulWidget {
  final int seconds;
  final TextStyle textStyle;

  const CountdownTimer({
    super.key,
    required this.seconds,
    required this.textStyle,
  });

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
    remainingSeconds = widget.seconds;
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
    timer.cancel();
    super.dispose();
  }
}

int generateRandomTime() {
  Random random = Random();
  int randomTimeInSeconds = random.nextInt(7200) + 10800;
  return randomTimeInSeconds;
}
