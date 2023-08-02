import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:prime_vpn/view_model/home_controller.dart';

import '../models/vpn.dart';
class LocationCountryCard extends StatelessWidget {
  final VPN vpn;
  const LocationCountryCard({super.key, required this.vpn});

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

@override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return InkWell(
      onTap: (){
        homeController.vpn.value = vpn;
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
          trailing:  Text(
            '${vpn.ping.toString()} ms',
            style: TextStyle(
                color: getColor(vpn.ping),
                fontWeight: FontWeight.w400,
                fontSize: 12),
          ),
        ),
      ),
    );
  }
}
