// import 'dart:convert';
import 'dart:convert';

import 'package:get/get.dart';

import '../models/vpn.dart';
import '../models/vpn_config.dart';
import '../services/vpn_engine.dart';
import '../views/account_page.dart';
import '../views/home_page.dart';
import '../views/location_page.dart';
// import '../models/vpn_config.dart';
// import '../services/vpn_engine.dart';

class HomeController extends GetxController{
  RxInt selectedIndex = 0.obs;
  final pages = [const HomePage(), const LocationPage(), const AccountPage()].obs;
  void onItemTapped(int index){
    selectedIndex.value = index;
  }

  // =========================================================
  final Rx<VPN?> vpn = VPN.fromJson({}).obs;
  final vpnState = VpnEngine.vpnDisconnected.obs;


  void connectToVpn() async {
    if (vpn.value!.openVPNConfigDataBase64.isEmpty) return;

    if (vpnState.value == VpnEngine.vpnDisconnected) {
      // log('\nBefore: ${vpn.value.openVPNConfigDataBase64}');

      final data = const Base64Decoder().convert(vpn.value!.openVPNConfigDataBase64);
      final config = const Utf8Decoder().convert(data);
      final vpnConfig = VpnConfig(
          country: vpn.value!.countryLong,
          username: 'vpn',
          password: 'vpn',
          config: config);
    } else {
      await VpnEngine.stopVpn();
    }
  }
}