import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_vpn/view_model/location_controller.dart';
import 'package:prime_vpn/widgets/utils.dart';

import '../widgets/location_country_card.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final locationController = Get.put(LocationController());

  @override
  void initState() {
    super.initState();
    locationController.getVPNData();
  }

  @override
  void dispose() {
    locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        floatingActionButton: (locationController.isLoading.value)
            ? const SizedBox()
            : FloatingActionButton(
                backgroundColor: Theme.of(context).colorScheme.onBackground,
                onPressed: () => locationController.getVPNData(),
                child: Icon(
                  Icons.refresh_rounded,
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          elevation: 1,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Text(
                'Locations (${locationController.vpnList.length})',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontFamily: 'Montserrat-Regular',
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
            ],
          ),
        ),
        body: (locationController.isLoading.value)
            ? loader()
            : (locationController.vpnList.isNotEmpty)
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: locationController.vpnList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: <Widget>[
                            LocationCountryCard(
                                vpn: locationController.vpnList[index]),
                          ],
                        );
                      },
                    ))
                : Center(
                    child: Text(
                      'No Data Found',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontFamily: 'Montserrat-Regular',
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
      ),
    );
  }
}
