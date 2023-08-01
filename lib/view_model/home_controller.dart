// import 'dart:convert';
import 'package:get/get.dart';
// import '../models/vpn_config.dart';
// import '../services/vpn_engine.dart';

class HomeController extends GetxController{
  // final Rx<Vpn> vpn = Pref.vpn.obs;
  // final vpnState = VpnEngine.vpnDisconnected.obs;
  //
  // void connectToVpn() async {
  //   if (vpn.value.openVPNConfigDataBase64.isEmpty) {
  //     MyDialogs.info(msg: 'Select a Location by clicking \'Change Location\'');
  //     return;
  //   }
  //   if (vpnState.value == VpnEngine.vpnDisconnected) {
  //     // log('\nBefore: ${vpn.value.openVPNConfigDataBase64}');
  //
  //     final data = const Base64Decoder().convert(vpn.value.openVPNConfigDataBase64);
  //     final config = const Utf8Decoder().convert(data);
  //     final vpnConfig = VpnConfig(
  //         country: vpn.value.countryLong,
  //         username: 'vpn',
  //         password: 'vpn',
  //         config: config);
  //   } else {
  //     await VpnEngine.stopVpn();
  //   }
  // }
}