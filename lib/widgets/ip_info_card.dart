import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class IpInfoCard extends StatelessWidget {
  final String svg;
  final String title;
  final String subtitle;
  const IpInfoCard({super.key, required this.svg, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleAlignment:ListTileTitleAlignment.center,
      leading:SizedBox(
        child: SvgPicture.asset(svg, fit: BoxFit.contain, height: 26, width: 26),
      ) ,
      title: Text(
        title,
        style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w400,
            fontSize: 14),
      ),
      subtitle:  Text(
        subtitle,
        style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w400,
            fontSize: 12),
      ),
    );
  }
}
