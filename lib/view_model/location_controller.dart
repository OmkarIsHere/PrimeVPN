import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_vpn/apis/apis.dart';
import '../models/vpn.dart';
import '../widgets/location_country_card.dart';

class LocationController extends GetxController {
  RxBool isLoading = false.obs;
  List<VPN> vpnList = [];

  Future<void>getVPNData() async{
    isLoading.value = true;
    vpnList = await APIs.getVPNServers();
    isLoading.value = false;
  }

  vpnData(BuildContext context) {
    return (vpnList.isNotEmpty)
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
                shrinkWrap: true,
                physics:const ClampingScrollPhysics(),
                itemCount: vpnList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                       LocationCountry(
                          svg: 'assets/svg/flags/${vpnList[index].countryShort.toLowerCase()}.svg',
                          countryName:vpnList[index].countryLong,
                          ping: vpnList[index].ping),
                    ],
                  );
                },
          )
        )
        : Center(
            child: Text(
              'No Data Found',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontFamily: 'Montserrat-Regular',
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            ),
          );
  }

}
