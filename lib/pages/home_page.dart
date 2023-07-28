import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          elevation: 1,
          title: RichText(
            maxLines: 1,
            text: TextSpan(
              text:'PRIME',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontFamily: 'Aquire-Regular',
                  fontSize: 18),
              children:<TextSpan>[
                TextSpan(
                  text:'VPN',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontFamily: 'Montserrat-Regular',
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ],
            ),
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
        child: Column(
          children: <Widget>[

          ],
        ),
        ),
      ),
    );
  }
}
