import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:prime_vpn/routes/app_routes.dart';
import 'package:prime_vpn/view_model/home_controller.dart';
import 'theme/theme.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  final myLightTheme= SystemUiOverlayStyle.dark.copyWith(
      systemNavigationBarColor:const Color(0xFFFFFFFF),
      statusBarColor:const Color(0xFFFFFFFF));

   final myDarkTheme= SystemUiOverlayStyle.light.copyWith(
       systemNavigationBarColor:const Color(0xFF12122E),
       statusBarColor:const Color(0xFF12122E));

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(myDarkTheme);
    // (Get.isDarkMode) ?SystemChrome.setSystemUIOverlayStyle(myDarkTheme):SystemChrome.setSystemUIOverlayStyle(myDarkTheme);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prime VPN',
      theme:darkTheme,
      // darkTheme:lightTheme,
      // themeMode: (Get.isDarkMode) ? ThemeMode.dark : ThemeMode.light,
      getPages: AppRoutes.appRoutes(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var homeController = Get.put(HomeController());

  @override
  void dispose() {
    homeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return Obx(
      ()=> Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        bottomNavigationBar: BottomNavigationBar(
            elevation: 2,
            backgroundColor: Theme.of(context).colorScheme.background,
            currentIndex: homeController.selectedIndex.value,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Theme.of(context).colorScheme.surface,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (index) => homeController.onItemTapped(index),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon:(homeController.selectedIndex.value ==0 )
                    ?SvgPicture.asset('assets/svg/ic_home_selected.svg')
                    :SvgPicture.asset('assets/svg/ic_home_unselected.svg'),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon:(homeController.selectedIndex.value ==1)
                    ?SvgPicture.asset('assets/svg/ic_search_selected.svg')
                    :SvgPicture.asset('assets/svg/ic_search_unselected.svg'),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon:(homeController.selectedIndex.value == 2)
                    ?SvgPicture.asset('assets/svg/ic_account_selected.svg')
                    :SvgPicture.asset('assets/svg/ic_account_unselected.svg'),
                label: 'Account',
              ),
            ]
        ),
        body: IndexedStack(index: homeController.selectedIndex.value,children:homeController.pages),
      ),
    );
  }
}
