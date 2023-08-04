import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:prime_vpn/view_model/route_to.dart';
import 'package:prime_vpn/view_model/wave_animation_controller.dart';
import 'package:prime_vpn/widgets/connected_vpn_overview.dart';
import 'package:prime_vpn/widgets/countdown_timer.dart';

import '../services/vpn_engine.dart';
import '../view_model/home_controller.dart';
import '../view_model/timer_controller.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  final waveAnimationController = Get.put(WaveAnimationController());
  final homeController = Get.find<HomeController>();
  final timerController = Get.put(TimerController());

  @override
  void dispose() {
    waveAnimationController.spiralController.dispose();
    waveAnimationController.controller.dispose();
    waveAnimationController.dispose();
    timerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;

    VpnEngine.vpnStageSnapshot().listen((event) {
      homeController.vpnState.value = event;
      print('Home Page: ${homeController.vpnState.value}');
    });

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 1,
        title: RichText(
          maxLines: 1,
          text: TextSpan(
            text: 'PRIME',
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontFamily: 'Aquire-Regular',
                fontSize: 18),
            children: <TextSpan>[
              TextSpan(
                text: 'VPN',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontFamily: 'Montserrat-Regular',
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
            ],
          ),
        ),
        actions: [
          InkWell(
            onTap: () => RouteTo.route('/info_page'),
            child: SizedBox(
              width: 30,
                child: Icon(Icons.info_outline_rounded,
                    color: Theme.of(context).colorScheme.secondary.withOpacity(0.7),
                size: 20,)),
          ),
          SizedBox(
            width: mq.width * 0.03,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const CountDownTimer(),
              Obx(()=> Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Center(
                    child: Text(
                      (homeController.vpnState.value == VpnEngine.vpnDisconnected)?'Not Connected':homeController.getVpnState(),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Montserrat-Regular',
                      ),
                    ),
                  ),
                )),
              const ConnectedVPNOverview(),
              AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Stack(
                    children: [
                      Center(
                          child: Obx(
                        () => (homeController.vpnState.value == VpnEngine.vpnConnected)
                            ? RotationTransition(
                                turns: CurvedAnimation(
                                    parent: waveAnimationController.controller, curve: Curves.linear),
                                alignment: Alignment.center,
                                child: SvgPicture.asset('assets/svg/wave.svg',height: 250, width: 250))
                            : const SizedBox(),
                      )),
                      Center(
                          child: Obx(
                        () => (homeController.vpnState.value == VpnEngine.vpnConnected)
                            ? RotationTransition(
                                turns: CurvedAnimation(
                                    parent: waveAnimationController.spiralController,
                                    curve: Curves.linear),
                                alignment: Alignment.center,
                                child: Image.asset('assets/images/spiral_net.png',
                                    height: 130, width: 130),
                              )
                            : Image.asset('assets/images/spiral_net.png',
                                height: 130, width: 130),
                      )),
                      Center(
                          child: InkWell(
                        onTap: () {
                         // waveAnimationController.isStarted.value = !waveAnimationController.isStarted.value;
                          homeController.connectToVpn();
                          (homeController.vpnState.value == VpnEngine.vpnConnected) ? timerController.startTimer():timerController.stopTimer();
                          // waveAnimationController.updateState();
                        },
                        child: Image.asset('assets/images/btn_start.png',
                            height: 65, width: 65),
                      )),
                    ],
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// StreamBuilder<VpnStatus?>(
// initialData: VpnStatus(),
// stream: VpnEngine.vpnStatusSnapshot(),
// builder: (context, snapshot) => Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// //download
// HomeCard(
// title: '${snapshot.data?.byteIn ?? '0 kbps'}',
// subtitle: 'DOWNLOAD',
// icon: CircleAvatar(
// radius: 30,
// backgroundColor: Colors.lightGreen,
// child: Icon(Icons.arrow_downward_rounded,
// size: 30, color: Colors.white),
// )),
//
// //upload
// HomeCard(
// title: '${snapshot.data?.byteOut ?? '0 kbps'}',
// subtitle: 'UPLOAD',
// icon: CircleAvatar(
// radius: 30,
// backgroundColor: Colors.blue,
// child: Icon(Icons.arrow_upward_rounded,
// size: 30, color: Colors.white),
// )),
// ],
// ))
// ]),
// );