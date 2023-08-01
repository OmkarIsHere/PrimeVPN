import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:prime_vpn/view_model/location_controller.dart';
import 'package:prime_vpn/widgets/all_widgets.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final locationController = LocationController();

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
        ()=> Scaffold(
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
              : locationController.vpnData(context),
      ),
    );
  }
}
