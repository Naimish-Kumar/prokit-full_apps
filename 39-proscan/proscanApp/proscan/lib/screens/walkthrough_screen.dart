import 'package:flutter/material.dart';
import 'package:proscan/component/AppButton.dart';
import 'package:proscan/models/walkthrough_model.dart';
import 'package:proscan/screens/account_screen.dart';
import 'package:proscan/screens/sign_in_screen.dart';
import 'package:proscan/utils/color.dart';
import 'package:proscan/utils/common.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WalkthroughScreen extends StatefulWidget {
  const WalkthroughScreen({Key? key}) : super(key: key);

  @override
  State<WalkthroughScreen> createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  int pageIndex = 0;
  PageController pages = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
              onPageChanged: (value) {
                pageIndex = value;
                setState(() {});
              },
              controller: pages,
              itemCount: WalkthroughPages.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 32),
                        child: Image.asset(WalkthroughPages[index].image.toString(), fit: BoxFit.fill, height: height * 0.5, width: width * 1),
                      ),
                      SizedBox(height: 30),
                      Text(WalkthroughPages[index].titleText.toString(), style: boldTextStyle(fontSize: 18), textAlign: TextAlign.center),
                      SizedBox(height: 8),
                      Text(WalkthroughPages[index].bodyText.toString(), style: secondaryTextStyle(), textAlign: TextAlign.center),
                    ],
                  ),
                );
              }),
          Positioned(
            width: width * 1,
            bottom: 16,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SmoothPageIndicator(
                      effect: ExpandingDotsEffect(dotHeight: 8, dotWidth: 8, activeDotColor: primaryColor), controller: pages, count: 3),
                  SizedBox(height: 16),
                  Divider(),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                          child: AppButton(
                        text: "Skip",
                        color: mode.theme ? darkPrimaryColor : primaryLightColor,
                        textColor: mode.theme ? Colors.white : primaryColor,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignInScreen()),
                          );
                        },
                      )),
                      SizedBox(width: 16),
                      Expanded(
                        child: AppButton(
                          text: "Next",
                          onTap: () {
                            pageIndex == 2
                                ? Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()))
                                : pages.nextPage(duration: Duration(seconds: 1), curve: Curves.decelerate);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
