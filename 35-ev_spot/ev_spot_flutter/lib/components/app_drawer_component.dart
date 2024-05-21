import 'package:ev_spot_flutter/components/app_logo_image_component.dart';
import 'package:ev_spot_flutter/main.dart';
import 'package:ev_spot_flutter/screens/faq_screen.dart';
import 'package:ev_spot_flutter/screens/home_screen.dart';
import 'package:ev_spot_flutter/screens/profile_screen.dart';
import 'package:ev_spot_flutter/screens/settings_screen.dart';
import 'package:ev_spot_flutter/screens/terms_condition_screen.dart';
import 'package:ev_spot_flutter/utils/common.dart';
import 'package:ev_spot_flutter/utils/images.dart';
import 'package:flutter/material.dart';

class AppDrawerComponent extends StatelessWidget {
  const AppDrawerComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: appStore.isDarkMode ? Colors.black.withAlpha(150) : Colors.white.withAlpha(232),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 250),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(backgroundImage: AssetImage(person_image), radius: 50),
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Rock Patel', style: boldTextStyle(fontSize: 22)),
                                Icon(Icons.arrow_forward_ios, size: 22),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.home, color: Theme.of(context).colorScheme.primary),
                      title: Text('Home', style: primaryTextStyle()),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.favorite, color: Theme.of(context).colorScheme.primary),
                      title: Text('Favorites', style: primaryTextStyle()),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: Image.asset(ic_terms_condition, height: 22, width: 22, color: Theme.of(context).colorScheme.primary),
                      title: Text('Terms & Conditions', style: primaryTextStyle()),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TermsAndConditionScreen()));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.help, color: Theme.of(context).colorScheme.primary),
                      title: Text('FAQs', style: primaryTextStyle()),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FaqScreen()));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.settings, color: Theme.of(context).colorScheme.primary),
                      title: Text('Settings', style: primaryTextStyle()),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SettingScreen()));
                      },
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.all(16), child: AppLogoImageComponent()),
                  Image.asset(splash_image2, fit: BoxFit.fill, width: MediaQuery.of(context).size.width),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
