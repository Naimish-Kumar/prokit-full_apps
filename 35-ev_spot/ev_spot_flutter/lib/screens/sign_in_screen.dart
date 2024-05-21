import 'package:ev_spot_flutter/components/app_logo_image_component.dart';
import 'package:ev_spot_flutter/screens/sign_up_screen.dart';
import 'package:ev_spot_flutter/screens/verification_screen.dart';
import 'package:ev_spot_flutter/utils/common.dart';
import 'package:ev_spot_flutter/utils/images.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // For Keyboard Dismiss
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          title: AppLogoImageComponent(isCenter: true),
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(width: MediaQuery.of(context).size.width, child: Image.asset(splash_image2, fit: BoxFit.cover)),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hi mate,', style: secondaryTextStyle(fontSize: 16)),
                    SizedBox(height: 6),
                    Text('Sign in Now', style: boldTextStyle(fontSize: 22)),
                    SizedBox(height: 40),
                    Text('Phone Number', style: primaryTextStyle()),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: inputDecoration(context, hintText: 'Enter Phone Number'),
                      keyboardType: TextInputType.number,
                      cursorColor: Theme.of(context).colorScheme.primary,
                      cursorWidth: 1,
                      maxLength: 10,
                    ),
                    SizedBox(height: 25),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                        },
                        child: Text('Continue', style: primaryTextStyle(color: Colors.white)),
                        style: Theme.of(context).elevatedButtonTheme.style,
                      ),
                    ),
                    SizedBox(height: 30),
                    Align(alignment: Alignment.center, child: Text('Or Continue With', style: primaryTextStyle())),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            child: OutlinedButton.icon(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => VerificationScreen()));
                              },
                              icon: Image.asset(ic_facebook, height: 22, width: 22),
                              label: Text('Facebook', style: boldTextStyle()),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Container(
                            height: 50,
                            child: OutlinedButton.icon(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => VerificationScreen()));
                              },
                              icon: Image.asset(ic_google, height: 22, width: 22),
                              label: Text('Google', style: boldTextStyle()),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
