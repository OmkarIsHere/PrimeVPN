import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget divider(BuildContext context){
  return Divider(
    height: 2,
    thickness: 1,
    color: Theme.of(context).dividerColor,
  );
}

Widget loader(){
  return Center(
    child: SizedBox(
        child: Lottie.asset('assets/json/circular-loader.json', height: 50,
          width: 50,fit: BoxFit.contain)
    ),
  );
}
