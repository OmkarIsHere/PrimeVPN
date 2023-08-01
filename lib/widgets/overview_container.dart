import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class OverViewContainer extends StatelessWidget {
  const OverViewContainer({super.key, required this.header, required this.data, required this.icon});
  final String header, data, icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: ListTile(
          leading:  SvgPicture.asset(icon, width: 26, height: 26),
          title: Text(
            header,
            style: TextStyle(
              color: Theme.of(context).colorScheme.surface,
              fontSize: 16,
            ),
          ),
          subtitle:Text(
            data,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
