import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prime_vpn/widgets/all_widgets.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 1,
        automaticallyImplyLeading: false,
        title: Text(
          'My Account',
          style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontFamily: 'Montserrat-Regular',
              fontWeight: FontWeight.w500,
              fontSize: 18),
        ),
        actions: [
          InkWell(
            onTap: () {},//=> Get.changeTheme(Get.isDarkMode ? ThemeData.light(): ThemeData.dark()),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Icon(Icons.brightness_4_rounded,
                    color: Theme.of(context).colorScheme.primary, size: 24),
              ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Center(
                    child: SvgPicture.asset('assets/svg/info/no_info.svg')),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: Text(
                    'Looks like You’re not signed in yet.',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Montserrat-Regular',
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 150,
                  height: 46,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: const Center(
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                leading: Text(
                  'ID',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 24),
                ),
                title: Text(
                  'User ID',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
                subtitle: Text(
                  'GuestUser-GSF27836',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
                trailing: SvgPicture.asset('assets/svg/ic_copy.svg',
                    height: 20, width: 20),
              ),
              divider(context),
              ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                leading: SvgPicture.asset('assets/svg/ic_premium.svg',
                    height: 24, width: 24),
                title: Text(
                  'Base Plan',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
                trailing: Container(
                  width: 100,
                  height: 32,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[Color(0xFF232D75), Color(0xFF6B7DEB)],
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Upgrade',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              divider(context),
              ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                leading: SvgPicture.asset('assets/svg/ic_restore.svg',
                    height: 22, width: 22),
                title: Text(
                  'Restore',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
              ),
              divider(context),
            ],
          ),
        ),
      ),
    );
  }
}
