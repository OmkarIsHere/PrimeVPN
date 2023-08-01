import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget divider(BuildContext context){
  return Divider(
    height: 2,
    thickness: 1,
    color: Theme.of(context).dividerColor,
  );
}

Widget loader(){
  return Center(
    child: SizedBox(
        child: Lottie.asset('assets/json/circular-loader.json', height: 70,
          width: 70,fit: BoxFit.contain)
    ),
  );
}


// SizedBox(
// child: GridView.count(
// crossAxisCount:(mq.width < 285)?1: 2,
// shrinkWrap: true,
// childAspectRatio:(mq.width < 285)?(3/1) :(2 / 1),
// mainAxisSpacing: 10,
// crossAxisSpacing: 10,
// children: const [
// OverViewContainer(
// header:"Ping",
// data: "100 ms",
// icon: 'assets/svg/ic_lightning.svg'),
// OverViewContainer(
// header:"Server",
// data: "India",
// icon: 'assets/svg/ic_globe.svg'),
// OverViewContainer(
// header: "Download",
// data: "100 Mbps",
// icon:'assets/svg/ic_download_ping.svg'),
// OverViewContainer(
// header: "Upload",
// data: "100 Mbps",
// icon: 'assets/svg/ic_upload_ping.svg'),
// ],
// ),
// ),