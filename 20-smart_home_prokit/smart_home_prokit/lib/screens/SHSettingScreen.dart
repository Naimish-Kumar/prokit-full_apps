import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:smart_home_prokit/main.dart';
import 'package:smart_home_prokit/screens/SHEditProfileScreen.dart';
import 'package:smart_home_prokit/screens/SHMemberScreen.dart';
import 'package:smart_home_prokit/utils/SHColors.dart';
import 'package:smart_home_prokit/utils/SHComman.dart';


class SHSettingScreen extends StatefulWidget {
  @override
  SHSettingScreenState createState() => SHSettingScreenState();
}

class SHSettingScreenState extends State<SHSettingScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          commonSHCachedNetworkImage(
            'https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg',
            fit: BoxFit.fill,
            width: context.width(),
          ),
          Container( width: context.width(), color: Colors.black38),
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(top: 40, right: 16),
            child: IconButton(
              onPressed: () {
                finish(context);
              },
              icon: Icon(Icons.close, color: white, size: 30),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                color: SHScaffoldDarkColor,
              ),
              padding: EdgeInsets.symmetric(vertical: 16),
              width: context.width(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  settIngContainer(
                    icon: Icons.edit,
                    title: 'Edit Profile',
                    textColor: white,
                    onTap: () {
                      SHEditProfileScreen().launch(
                        context,
                        pageRouteAnimation: PageRouteAnimation.SlideBottomTop,
                      );
                    },
                  ),
                  settIngContainer(
                    icon: Icons.person,
                    title: 'Member',
                    textColor: white,
                    onTap: () {
                      SHMemberScreen().launch(context, pageRouteAnimation: PageRouteAnimation.SlideBottomTop);
                    },
                  ),
                  settIngContainer(icon: Icons.settings, title: 'Setting', textColor: white),
                  16.height,
                  settIngContainer(icon: Icons.chat, title: 'Terms of use', textColor: white),
                  settIngContainer(icon: Icons.send, title: 'Contact', textColor: white),
                  Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(right: 16, left: 16, top: 8, bottom: 8),
                    decoration: BoxDecoration(color: SHContainerColor, borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('images/ic_theme.png', height: 30, width: 30, color: white).paddingOnly(left: 6),
                            16.width,
                            Text('DarkMode', style: primaryTextStyle(color: white)),
                          ],
                        ),
                        Switch(
                          value: appStore.isDarkModeOn,
                          activeColor: appColorPrimary,
                          onChanged: (s) {
                            setState(() {});
                            appStore.toggleDarkMode(value: s);
                          },
                        )
                      ],
                    ),
                  ),
                  settIngContainer(icon: Icons.logout, title: 'SignOut', textColor: Colors.deepOrange),
                  Text(
                    'Version 11',
                    style: secondaryTextStyle(size: 12),
                  ).paddingLeft(16)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
