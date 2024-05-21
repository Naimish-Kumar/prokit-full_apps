import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:scribblr/components/dynamic_progress.dart';
import 'package:scribblr/screens/auth/sign_in.dart';
import 'package:scribblr/screens/auth/sign_up.dart';
import 'package:scribblr/screens/profile_setup/profile_completion.dart';
import 'package:scribblr/screens/profile_setup/topic_select.dart';
import 'package:scribblr/utils/images.dart';

import '../../main.dart';
import '../../utils/colors.dart';
import 'country_select.dart';
import 'discover_people.dart';

class ProfileWalkthroughScreen extends StatefulWidget {
  const ProfileWalkthroughScreen({super.key});

  @override
  State<ProfileWalkthroughScreen> createState() => _ProfileWalkthroughScreenState();
}

class _ProfileWalkthroughScreenState extends State<ProfileWalkthroughScreen> {
  int _currentIndex = 0;
  int totalPageCount = 5;

  // Create a PageController
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            surfaceTintColor: appStore.isDarkMode ? scaffoldDarkColor : context.scaffoldBackgroundColor,
            iconTheme: IconThemeData(color: appStore.isDarkMode ? scaffoldLightColor : scaffoldDarkColor),
            backgroundColor: appStore.isDarkMode ? scaffoldDarkColor : context.scaffoldBackgroundColor,
            title: DynamicProgressBar(currentScreenIndex: _currentIndex),
          ),
          body: PageView.builder(
            // Use the PageController
            controller: _pageController,
            itemCount: totalPageCount,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return SelectCountry();
                case 1:
                  return ProfileComplete();
                case 2:
                  return SignUpScreen();
                case 3:
                  return SelectTopic();
                case 4:
                  return DiscoverPeople();
                default:
                  return SelectCountry();
              }
            },
          ),
          bottomNavigationBar: _currentIndex == 3
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppButton(
                      elevation: 0,
                      onTap: () {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      color: appStore.isDarkMode ? Color(0xFF1F222A) : skipbutton,
                      shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text('Skip', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: primaryColor)),
                    ).expand(),
                    16.width,
                    AppButton(
                      elevation: 0,
                      onTap: () {
                        _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                      },
                      color: primaryColor,
                      shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      child: Text('Continue', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white)),
                    ).expand(),
                  ],
                ).paddingAll(16)
              : Container(
                  padding: EdgeInsets.all(16),
                  child: AppButton(
                    elevation: 0,
                    onTap: () {
                      int currentPage = _pageController.page?.round() ?? 0;
                      if (currentPage == totalPageCount - 1) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            Future.delayed(Duration(seconds: 2), () {
                              Navigator.of(context).pop();
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));
                            });
                            return AlertDialog(
                              elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              contentPadding: EdgeInsets.all(16),
                              actions: [
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      15.height,
                                      Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(shape: BoxShape.circle, color: indicatorColor),
                                        child: Icon(Icons.person, color: Colors.white),
                                      ),
                                      SizedBox(height: 15),
                                      Text(
                                        'SignUp Successful!',
                                        style: TextStyle(color: primaryColor),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Your Account has been created. Please wait a moment, we are preparing for you..',
                                        style: secondaryTextStyle(),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 10),
                                      Lottie.asset(loader_lottie, width: 100, fit: BoxFit.cover),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    color: primaryColor,
                    shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Builder(
                      builder: (BuildContext context) {
                        return _pageController.hasClients && _pageController.page?.round() == totalPageCount - 1
                            ? Text('Finish',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ))
                            : Text(
                                'Continue',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              );
                      },
                    ),
                  ),
                ),
        );
      },
    );
  }
}
