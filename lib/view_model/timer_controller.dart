import 'dart:async';
import 'package:get/get.dart';

class TimerController extends GetxController {
  final Rx<Duration> _duration = const Duration().obs;
  Timer? _timer;
  RxString seconds = '00'.obs;
  RxString minutes = '00'.obs;
  RxString hours = '00'.obs;

  @override
  void onClose() {
    _timer?.cancel();
    _timer = null;
    _duration.value = const Duration();
    super.onClose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _duration.value = Duration(seconds: _duration.value.inSeconds + 1);
      seconds.value = twoDigit(_duration.value.inSeconds.remainder(60));
      minutes.value = twoDigit(_duration.value.inMinutes.remainder(60));
      hours.value = twoDigit(_duration.value.inHours.remainder(60));
    });
  }

  void stopTimer() {
    _timer?.cancel();
    _timer = null;
    _duration.value = const Duration();
  }

  String twoDigit(int n) => n.toString().padLeft(2, '0');

}
