import 'package:get/get.dart';
import 'package:prime_vpn/apis/apis.dart';
import '../models/vpn.dart';

class LocationController extends GetxController {
  RxBool isLoading = false.obs;
  List<VPN> vpnList = [];

  Future<void> getVPNData() async {
    isLoading.value = true;
    vpnList = await APIs.getVPNServers();
    isLoading.value = false;
  }

}
