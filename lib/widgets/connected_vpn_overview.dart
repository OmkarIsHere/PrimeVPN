import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view_model/home_controller.dart';
import 'overview_container.dart';

class ConnectedVPNOverview extends StatefulWidget {
  const ConnectedVPNOverview({super.key});

  @override
  State<ConnectedVPNOverview> createState() => _ConnectedVPNOverviewState();
}

class _ConnectedVPNOverviewState extends State<ConnectedVPNOverview> {
  final homeController = Get.find<HomeController>();

  @override
  void dispose() {
    homeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Obx(
      ()=> SizedBox(
        child: GridView.count(
          crossAxisCount:(mq.width < 285)?1: 2,
          shrinkWrap: true,
          childAspectRatio:(mq.width < 285)?(3/1) :(2 / 1),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children:[
            OverViewContainer(
                header:"Ping",
                data:(homeController.vpn.value!.ping != 0) ? '${homeController.vpn.value!.ping.toString()} ms': '--',
                icon: 'assets/svg/ic_lightning.svg'),
            OverViewContainer(
                header:"Server",
                data: (homeController.vpn.value!.countryLong.isNotEmpty)? homeController.vpn.value!.countryLong : '--',
                icon: 'assets/svg/ic_globe.svg'),
            OverViewContainer(
                header: "Download",
                data: "100 Mbps",
                icon:'assets/svg/ic_download_ping.svg'),
            OverViewContainer(
                header: "Upload",
                data: "100 Mbps",
                icon: 'assets/svg/ic_upload_ping.svg'),
          ],
        ),
      ),
    );
  }
}
