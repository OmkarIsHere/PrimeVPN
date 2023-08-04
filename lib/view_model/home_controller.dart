import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/vpn.dart';
import '../models/vpn_config.dart';
import '../services/vpn_engine.dart';
import '../views/account_page.dart';
import '../views/home_page.dart';
import '../views/location_page.dart';

class HomeController extends GetxController{
  RxInt selectedIndex = 0.obs;
  final pages = [const HomePage(), const LocationPage(), const AccountPage()].obs;
  void onItemTapped(int index){
    selectedIndex.value = index;
  }

  // ================================================================================================

  Color getColor(int ping){
    if(ping>=70){
      return Colors.red.shade700;
    }
    else if(ping<70 && ping>20){
      return Colors.amber;
    }
    else if(ping<=20){
      return Colors.green.shade700;
    }
    else{
      return Colors.blue.shade600;
    }

  }

  // ==============================================================================================
  final Rx<VPN?> vpn = VPN.fromJson({}).obs;
  final vpnState = VpnEngine.vpnDisconnected.obs;
  // RxBool isStarted = false.obs;

  void connectToVpn() async {
    if (vpn.value!.openVPNConfigDataBase64.isEmpty) return;

    if (vpnState.value == VpnEngine.vpnConnected) {
      await VpnEngine.stopVpn();
      // isStarted.value = false;
      print('if block: ${vpnState.value}');

    }else if(vpnState.value == VpnEngine.vpnDisconnected){
      final data = const Base64Decoder().convert(vpn.value!.openVPNConfigDataBase64);
      final config = const Utf8Decoder().convert(data);
      final vpnConfig = VpnConfig(
          country: vpn.value!.countryLong,
          username: 'vpn',
          password: 'vpn',
          config: config);

      VpnEngine.startVpn(vpnConfig);
      // isStarted.value = true;
      print('if block: ${vpnState.value}');
    } else {
      await VpnEngine.stopVpn();
      Future.delayed(const Duration(seconds: 3),(){
        final data = const Base64Decoder().convert(vpn.value!.openVPNConfigDataBase64);
        final config = const Utf8Decoder().convert(data);
        final vpnConfig = VpnConfig(
        country: vpn.value!.countryLong,
        username: 'vpn',
        password: 'vpn',
        config: config);

        VpnEngine.startVpn(vpnConfig);
        // isStarted.value = true;
        print('else: ${vpnState.value}');
      });
    }

  }

  String capitalize(String str){
    str = str.replaceAll('_', ' ');
    return (str[0].toUpperCase() + str.substring(1));
  }

  String getVpnState(){
    String str = vpnState.value;
    str = str.replaceAll('_', ' ');
    return (str[0].toUpperCase() + str.substring(1));
  }

  void changeVpnState(){
    VpnEngine.vpnStageSnapshot().listen((event) {
      vpnState.value = event;
      print('Home Page: ${vpnState.value}');
    });
  }
}
