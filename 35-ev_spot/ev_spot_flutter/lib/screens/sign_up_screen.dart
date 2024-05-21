import 'package:ev_spot_flutter/components/app_logo_image_component.dart';
import 'package:ev_spot_flutter/screens/terms_condition_screen.dart';
import 'package:ev_spot_flutter/screens/verification_screen.dart';
import 'package:ev_spot_flutter/utils/common.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(elevation: 0, centerTitle: true, title: AppLogoImageComponent()),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Sign up Now', style: boldTextStyle(fontSize: 22)),
              SizedBox(height: 6),
              Text('Looks like you\'re not registered yet', style: secondaryTextStyle(fontSize: 16)),
              SizedBox(height: 40),
              Text('Phone Number', style: primaryTextStyle()),
              SizedBox(height: 10),
              TextFormField(
                decoration: inputDecoration(context, hintText: 'Enter Phone Number'),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                cursorColor: Theme.of(context).colorScheme.primary,
                cursorWidth: 1,
                maxLength: 10,
              ),
              SizedBox(height: 20),
              Text('Full Name', style: primaryTextStyle()),
              SizedBox(height: 10),
              TextFormField(
                decoration: inputDecoration(context, hintText: 'Enter Full Name'),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                cursorColor: Theme.of(context).colorScheme.primary,
                cursorWidth: 1,
              ),
              SizedBox(height: 20),
              Text('Email Address', style: primaryTextStyle()),
              SizedBox(height: 10),
              TextFormField(
                decoration: inputDecoration(context, hintText: 'Enter Email Address'),
                keyboardType: TextInputType.emailAddress,
                cursorColor: Theme.of(context).colorScheme.primary,
                cursorWidth: 1,
              ),
              SizedBox(height: 25),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => VerificationScreen()));
                  },
                  child: Text('Continue', style: primaryTextStyle(color: Colors.white)),
                  style: Theme.of(context).elevatedButtonTheme.style,
                ),
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text('By Continue you\'re agreed to our', style: primaryTextStyle()),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TermsAndConditionScreen()));
                      },
                      child: Text('Terms & Conditions', style: primaryTextStyle(color: Theme.of(context).colorScheme.primary)),
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
