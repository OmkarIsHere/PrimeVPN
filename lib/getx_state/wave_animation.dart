import 'package:get/get.dart';

class WaveAnimationController extends GetxController{
  RxBool isStarted = false.obs;

  updateState() =>isStarted.value = !isStarted.value;
}