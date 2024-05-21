import 'package:flutter/material.dart';
import 'package:music_flutter_app/components/scaffold_background.dart';

import '../utils/colors.dart';

class AppScaffold extends StatelessWidget {
  final bool resizeToAvoidBottomInset;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget body;

  AppScaffold({required this.body, this.resizeToAvoidBottomInset = false, this.appBar, this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      bottomNavigationBar: bottomNavigationBar,
      appBar: appBar,
      body: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          Positioned(
            top: -80,
            right: -150,
            child: ScaffoldBackground(color: primaryColor),
          ),
          Positioned(
            bottom: -80,
            left: -150,
            child: ScaffoldBackground(color: secondaryColor),
          ),
          body,
        ],
      ),
    );
  }
}
