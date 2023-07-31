import 'package:flutter/material.dart';
import 'package:prime_vpn/widgets/all_widgets.dart';

import '../widgets/location_country_card.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        onPressed: () {},
        child: Icon(
          Icons.refresh_rounded,
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 1,
        automaticallyImplyLeading: false,
        title: Text(
          'Locations',
          style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontFamily: 'Montserrat-Regular',
              fontWeight: FontWeight.w500,
              fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  const LocationCountry(
                      svg: 'assets/svg/flags/us.svg',
                      countryName: 'United States',
                      ping: '100'),
                  divider(context),
                ],
              );
            }),
      ),
    );
  }
}
