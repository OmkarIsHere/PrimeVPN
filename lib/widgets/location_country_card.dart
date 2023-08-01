import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class LocationCountry extends StatelessWidget {
  final String svg;
  final String countryName;
  final String ping;
  const LocationCountry({super.key, required this.svg, required this.countryName, required this.ping});

  Color getColor(int ping){
  if(ping>=70){
    return Colors.red.shade700;
  }
  else if(ping<70 && ping>20){
    return Colors.amber;
  }
  else if(ping<=20){
    return Colors.green.shade700;
  }
  else{
    return Colors.blue.shade600;
  }

}

@override
  Widget build(BuildContext context) {
    return Card(
      margin:const EdgeInsets.symmetric(vertical:5),
      color: Theme.of(context).colorScheme.onBackground,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
      child: ListTile(
        titleAlignment:ListTileTitleAlignment.center,
      leading:SizedBox(
        height: 20,
        width: 30,
        child: SvgPicture.asset(svg, fit: BoxFit.cover),
      ) ,
        title: Text(
          countryName,
          style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w400,
              fontSize: 14),
        ),
        trailing:  Text(
          '$ping ms',
          style: TextStyle(
              color: getColor(int.parse(ping)),
              fontWeight: FontWeight.w400,
              fontSize: 12),
        ),
      ),
    );
  }
}
