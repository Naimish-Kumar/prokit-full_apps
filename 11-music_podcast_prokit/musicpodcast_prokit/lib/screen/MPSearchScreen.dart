import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:musicpodcast_prokit/utils/MPColors.dart';

class MPSearchScreen extends StatefulWidget {
  static String tag = '/MPSearchScreen';

  @override
  MPSearchScreenState createState() => MPSearchScreenState();
}

class MPSearchScreenState extends State<MPSearchScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mpAppBackGroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: mpSearchBarBackGroundColor,
        title: TextField(
          style: primaryTextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: InputDecoration(hintText: 'Search on Music PodCast...', hintStyle: primaryTextStyle(color: Colors.white), border: InputBorder.none),
        ),
        actions: [
          Icon(Icons.settings_voice_outlined).paddingOnly(right: 16),
        ],
      ),
    );
  }
}
