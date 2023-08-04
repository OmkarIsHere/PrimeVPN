import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_vpn/widgets/utils.dart';
import 'package:prime_vpn/widgets/ip_info_card.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 1,
        leading: InkWell(
          onTap: ()=>Get.back(),
          child: Icon(Icons.arrow_back, size: 24, color: Theme.of(context).colorScheme.secondary),
        ),
        title: Text(
          'Connection Info',
          style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontFamily: 'Montserrat-Regular',
              fontWeight: FontWeight.w400,
              fontSize: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>  [
              IpInfoCard(
                  svg: 'assets/svg/info/location-pin.svg',
                  title: 'IP Address',
                  subtitle: 'subtitle'),
              divider(context),
              IpInfoCard(
                  svg: 'assets/svg/info/navigate.svg',
                  title: 'Address',
                  subtitle: 'subtitle'),
              divider(context),
              IpInfoCard(
                  svg: 'assets/svg/info/internet-provider.svg',
                  title: 'Internet Provider',
                  subtitle: 'subtitle'),
              divider(context),
              IpInfoCard(
                  svg: 'assets/svg/info/gps-location.svg',
                  title: 'Pin Code',
                  subtitle: 'subtitle'),
              divider(context),
              IpInfoCard(
                  svg: 'assets/svg/info/time-zone.svg',
                  title: 'Time Zone',
                  subtitle: 'subtitle'),
              divider(context),
            ],
          ),
        ),
      ),
    );
  }
}
