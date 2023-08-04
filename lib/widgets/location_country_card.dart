import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:prime_vpn/services/vpn_engine.dart';
import 'package:prime_vpn/view_model/home_controller.dart';
import 'package:prime_vpn/view_model/location_controller.dart';
import 'package:prime_vpn/view_model/timer_controller.dart';

import '../models/vpn.dart';
class LocationCountryCard extends StatelessWidget {
  final VPN vpn;
  const LocationCountryCard({super.key, required this.vpn});

@override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final timerController = Get.find<TimerController>();
    final locationController = Get.find<LocationController>();
    return InkWell(
      onTap: (){
        homeController.vpn.value = vpn;
        if(homeController.vpnState.value == VpnEngine.vpnConnected) {
          VpnEngine.stopVpn();
          Future.delayed(const Duration(seconds: 3), ()=>homeController.connectToVpn());
        }else{
          homeController.connectToVpn();
        }
        homeController.changeVpnState();
        (homeController.vpnState.value == VpnEngine.vpnConnected) ? timerController.startTimer():timerController.stopTimer();
        homeController.onItemTapped(0);
      },
      child: Card(
        margin:const EdgeInsets.symmetric(vertical:5),
        color: Theme.of(context).colorScheme.onBackground,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        child: ListTile(
          titleAlignment:ListTileTitleAlignment.center,
          selectedTileColor:  Theme.of(context).colorScheme.primary,
        leading:SizedBox(
          height: 20,
          width: 30,
          child: SvgPicture.asset('assets/svg/flags/${vpn.countryShort.toLowerCase()}.svg', fit: BoxFit.cover),
        ) ,
          title: Text(
            vpn.countryLong,
            style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.w400,
                fontSize: 14),
          ),
          trailing: Text(
            locationController.formatBytes(vpn.speed, 2),
            style: TextStyle(
                color:Colors.blue, //homeController.getColor(int.parse(vpn.ping)),
                fontWeight: FontWeight.w400,
                fontSize: 12),
          ),
        ),
      ),
    );
  }
}
