import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:prime_vpn/view_model/timer_controller.dart';

import '../services/vpn_engine.dart';
import '../view_model/home_controller.dart';

class CountDownTimer extends StatefulWidget {
   const CountDownTimer({super.key});

  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  final timerController = Get.find<TimerController>();
  final homeController = Get.find<HomeController>();

    @override
    void dispose(){
      timerController.dispose();
      super.dispose();
    }


  @override
  Widget build(BuildContext context) {
      (homeController.vpnState.value == VpnEngine.vpnConnected) ? timerController.startTimer():timerController.stopTimer();
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
