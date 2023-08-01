import 'package:flutter/material.dart';
import 'overview_container.dart';

class ConnectedVPNOverview extends StatefulWidget {
  const ConnectedVPNOverview({super.key});

  @override
  State<ConnectedVPNOverview> createState() => _ConnectedVPNOverviewState();
}

class _ConnectedVPNOverviewState extends State<ConnectedVPNOverview> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return SizedBox(
      child: GridView.count(
        crossAxisCount:(mq.width < 285)?1: 2,
        shrinkWrap: true,
        childAspectRatio:(mq.width < 285)?(3/1) :(2 / 1),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: const [
          OverViewContainer(
              header:"Ping",
              data: "100 ms",
              icon: 'assets/svg/ic_lightning.svg'),
          OverViewContainer(
              header:"Server",
              data: "India",
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
    );
  }
}
