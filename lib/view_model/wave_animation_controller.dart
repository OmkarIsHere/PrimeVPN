import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
class WaveAnimationController extends GetxController with GetTickerProviderStateMixin{
  // RxBool isStarted = false.obs;
  late AnimationController controller = AnimationController(vsync: this, duration: const Duration(seconds: 15))..repeat().obs;
  late AnimationController spiralController = AnimationController(vsync: this, duration: const Duration(seconds: 7))..repeat().obs;

  // updateState() =>isStarted.value = !isStarted.value;

  @override
  void onClose() {
    controller.dispose();
    spiralController.dispose();
    super.onClose();
  }
}