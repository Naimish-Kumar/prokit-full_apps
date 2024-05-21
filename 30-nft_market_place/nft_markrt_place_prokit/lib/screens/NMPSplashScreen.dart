import 'dart:async';

import 'package:flutter/material.dart';
import 'package:opensea_ui/screens/NMPStartScreen.dart';
import 'package:opensea_ui/utils/OSCommon.dart';
import 'package:opensea_ui/utils/OSConstants.dart';

class NMPSplashScreen extends StatefulWidget {
  @override
  State<NMPSplashScreen> createState() => _NMPSplashScreenState();
}

class _NMPSplashScreenState extends State<NMPSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    osSetStatusBarColor(statusBarColor: Colors.transparent);

    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => NMPStartScreen()));
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.white),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network('$osImageBaseUrl/os_appIcon.png', height: 80, width: 80, fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'NFT Market Place',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
