import 'package:csv/csv.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:prime_vpn/models/vpn.dart';

class APIs {
  static Future<List<VPN>> getVPNServers() async {
    final List<VPN> vpnList = [];
    try {
      const url = 'http://www.vpngate.net/api/iphone/';
      final uri = Uri.parse(url);
      final res = await get(uri);
      final csvString = res.body.split('#')[1].replaceAll('*', '');

      List<List<dynamic>> list = const CsvToListConverter().convert(csvString);
      final header = list[0];

      Map<String, dynamic> tempJson = {};
      for (int i = 1; i < list.length - 1; i++) {
        for (int j = 0; j < header.length; j++) {
          tempJson.addAll({header[j].toString(): list[i][j]});
        }
        vpnList.add(VPN.fromJson(tempJson));
      }
    } catch (e) {
      if (kDebugMode) {
        print('Apis.dart Exception: $e');
      }
    }
    return vpnList;
  }
}
