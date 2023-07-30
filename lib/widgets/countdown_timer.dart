import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:prime_vpn/view_model/timer_controller.dart';
class CountDownTimer extends StatelessWidget {
  final bool isStarted;
  const CountDownTimer({super.key, required this.isStarted});

  @override
  Widget build(BuildContext context) {
    final timerController = Get.put(TimerController());
      isStarted ? timerController.startTimer():timerController.stopTimer();

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

