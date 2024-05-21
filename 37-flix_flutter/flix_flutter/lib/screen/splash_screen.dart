import 'dart:async';

import 'package:flutter/material.dart';

import 'walkthrough_screen/walkthrough_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => WalkthroughScreen()), (route) => false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade800,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.movie_creation_rounded, size: 80, color: Colors.white),
            Text('Flix', style: TextStyle(fontSize: 48, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
