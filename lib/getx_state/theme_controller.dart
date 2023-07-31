import 'package:get/get.dart';

class ThemeController extends GetxController{
  RxBool isLight = false.obs;

  void changeTheme(){
    isLight.value =  true;
  }
}