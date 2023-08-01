import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:prime_vpn/view_model/timer_controller.dart';
class CountDownTimer extends StatefulWidget {
  final bool isStarted;
   const CountDownTimer({super.key, required this.isStarted});

  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
   final timerController = TimerController();

    @override
    void dispose(){
      timerController.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
      widget.isStarted ? timerController.startTimer():timerController.stopTimer();

      return  Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 5),
        child: Center(
          child: Obx(() => Text(
              '${timerController.hours} : ${timerController.minutes} : ${timerController.seconds}',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 32,
                fontWeight: FontWeight.w400,
                fontFamily: 'Montserrat-Regular',
              ),
            ),
          ),
        ),
      );
    }
}

