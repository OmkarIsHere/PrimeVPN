import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class LocationCountry extends StatelessWidget {
  final String svg;
  final String countryName;
  final String ping;
  const LocationCountry({super.key, required this.svg, required this.countryName, required this.ping});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleAlignment:ListTileTitleAlignment.center,
    leading:SizedBox(
      height: 20,
      child: AspectRatio(
        aspectRatio: 4/3,
        child: SvgPicture.asset(svg, fit: BoxFit.cover),
      ),
    ) ,
      title: Text(
        countryName,
        style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w400,
            fontSize: 14),
      ),
      subtitle:  Text(
        '$ping ms',
        style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w400,
            fontSize: 12),
      ),
    );
  }
}
