import 'package:get/get.dart';
import 'package:prime_vpn/main.dart';
import 'package:prime_vpn/views/account_page.dart';
import 'package:prime_vpn/views/home_page.dart';
import 'package:prime_vpn/views/info_page.dart';
import 'package:prime_vpn/views/location_page.dart';

class AppRoutes{

  static appRoutes()=>[
    GetPage(
        name: '/',
        page: ()=>const MyHomePage()
    ),
    GetPage(
        name: '/home_page',
        page: ()=>const HomePage()
    ),
    GetPage(
        name: '/info_page',
        page: ()=>const InfoPage(),
        transition: Transition.cupertino,
        transitionDuration: const Duration(milliseconds: 500)
    ),
    GetPage(
        name: '/account_page',
        page: ()=>const AccountPage()
    ),
    GetPage(
        name: '/location_page',
        page: ()=>const LocationPage()
    ),
  ];

}