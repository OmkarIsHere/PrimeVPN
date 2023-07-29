import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:prime_vpn/getx_state/wave_animation.dart';
import 'package:prime_vpn/pages/info_page.dart';
import 'package:prime_vpn/widgets/all_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 10))
        ..repeat();
  // late Animation<double> animation;
  late AnimationController spiralController =
      AnimationController(vsync: this, duration: const Duration(seconds: 7))
        ..repeat();
  // late Animation<double> spiralAnimation;

  // animation = CurvedAnimation(parent: controller, curve: Curves.linear);
  // spiralAnimation = CurvedAnimation(parent: spiralController, curve: Curves.linear);

  @override
  void dispose() {
    spiralController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    final waveAnimationController = Get.put(WaveAnimationController());
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
            onTap: () => Get.to(const InfoPage()),
            child: SizedBox(
                width: 24,
                height: 24,
                child: Icon(Icons.info_outline_rounded,
                    color: Theme.of(context).colorScheme.secondary.withOpacity(0.7))),
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
              SizedBox(
                // height: mq.height*0.3,
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  childAspectRatio: (2 / 1),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: [
                    overViewBox(context, "Ping", "100 ms",
                        'assets/svg/ic_lightning.svg'),
                    overViewBox(
                        context, "Server", "India", 'assets/svg/ic_globe.svg'),
                    overViewBox(context, "Download", "100 Mbps",
                        'assets/svg/ic_download_ping.svg'),
                    overViewBox(context, "Upload", "100 Mbps",
                        'assets/svg/ic_upload_ping.svg'),
                  ],
                ),
              ),
              AspectRatio(
                aspectRatio: 1 / 1,
                child: Stack(
                  children: [
                    Center(
                        child: Obx(
                      () => (waveAnimationController.isStarted.value)
                          ? RotationTransition(
                              turns: CurvedAnimation(
                                  parent: controller, curve: Curves.linear),
                              alignment: Alignment.center,
                              child: SvgPicture.asset('assets/svg/wave.svg',height: 250, width: 250))
                          : const SizedBox(),
                    )),
                    Center(
                        child: Obx(
                      () => (waveAnimationController.isStarted.value)
                          ? RotationTransition(
                              turns: CurvedAnimation(
                                  parent: spiralController,
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
                      onTap: () => waveAnimationController.updateState(),
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
