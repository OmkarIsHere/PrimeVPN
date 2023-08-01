import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:prime_vpn/view_model/route_to.dart';
import 'package:prime_vpn/view_model/wave_animation_controller.dart';
import 'package:prime_vpn/widgets/connected_vpn_overview.dart';
import 'package:prime_vpn/widgets/countdown_timer.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  final waveAnimationController = WaveAnimationController();

  @override
  void dispose() {
    waveAnimationController.spiralController.dispose();
    waveAnimationController.controller.dispose();
    waveAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;

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
              Obx(() =>CountDownTimer(isStarted: waveAnimationController.isStarted.value)),
              Obx(()=> Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Center(
                    child: Text(
                      (waveAnimationController.isStarted.value)?'Connected':'Not Connected',
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
                        () => (waveAnimationController.isStarted.value)
                            ? RotationTransition(
                                turns: CurvedAnimation(
                                    parent: waveAnimationController.controller, curve: Curves.linear),
                                alignment: Alignment.center,
                                child: SvgPicture.asset('assets/svg/wave.svg',height: 250, width: 250))
                            : const SizedBox(),
                      )),
                      Center(
                          child: Obx(
                        () => (waveAnimationController.isStarted.value)
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
                         waveAnimationController.updateState();
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
  String capitalize(String str){
    str = str.replaceAll('_', ' ');
    return (str[0].toUpperCase() + str.substring(1));
  }
}
