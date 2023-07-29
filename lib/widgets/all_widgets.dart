import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget overViewBox(BuildContext context, String header, String data, String icon){
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