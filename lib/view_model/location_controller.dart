import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_vpn/apis/apis.dart';
import '../models/vpn.dart';

class LocationController extends GetxController {
  RxBool isLoading = false.obs;
  List<VPN> vpnList = [];

  Future<void> getVPNData() async {
    vpnList.clear();
    isLoading.value = true;
    vpnList = await APIs.getVPNServers();
    isLoading.value = false;
  }


  String formatBytes(int bytes, int decimals) {
    if (bytes <= 0) return "0 B";
    const suffixes = ['Bps', "Kbps", "Mbps", "Gbps", "Tbps"];
    var i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

}
