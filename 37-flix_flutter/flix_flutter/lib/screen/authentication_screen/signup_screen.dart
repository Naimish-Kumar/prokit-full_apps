import 'package:flutter/material.dart';
import 'package:prokit_flutter/model/signup_model.dart';
import 'package:prokit_flutter/screen/authentication_screen/sign_in_screen.dart';
import 'package:prokit_flutter/utils/common_widgets.dart';
import 'package:prokit_flutter/utils/constants.dart';

import 'verification_screen.dart';

class SignUpScreen extends StatefulWidget {
  String? title;
  bool? isEmail;

  SignUpScreen({this.title, this.isEmail});

  @override
  State<SignUpScreen> createState() {
    return SignUpScreenState();
  }
}

class SignUpScreenState extends State<SignUpScreen> with TickerProviderStateMixin {
  late GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late FocusNode curentFocusNode;
  bool passwordVisibility = false;
  bool isFormValidated = false;
  List prefixIcons = [
    Icon(
      Icons.person_rounded,
    ),
    Icon(Icons.call),
  ];

  List<TextEditingController> textEditingCont = List.generate(3, (index) => TextEditingController());
  List<FocusNode> focus = List.generate(3, (index) => FocusNode());

  List<String> imageList = [FACEBOOK_LOGO, GOOGLE_LOGO, APPLE_LOGO];
  List<String> passwordValidationTabs = ['Uppercase', 'Numbers', 'Lowercase', '8+ Characters'];

  @override
  void initState() {
    super.initState();
    curentFocusNode = FocusNode();
  }

  void dispose() {
    curentFocusNode.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: backButton(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Sign Up',
                  style: boldTextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Text(
                  'Enter your user Information below or continue with one of your social account ',
                  textAlign: TextAlign.center,
                  style: secondaryTextStyle(fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 24),
            Form(
              key: formKey,
              child: Wrap(
                direction: Axis.vertical,
                spacing: 16,
                children: [
                  Wrap(
                      spacing: 16,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      direction: Axis.vertical,
                      children: List.generate(
                        textEditingCont.length,
                        (index) => TextFormField(
                            controller: textEditingCont[index],
                            keyboardType: getstartWithEmail(IsEmail: widget.isEmail ?? false)[index].keyboardType,
                            obscureText: index == 2 ? !passwordVisibility : false,
                            focusNode: focus[index],
                            cursorHeight: 24,
                            cursorRadius: Radius.circular(4),
                            style: primaryTextStyle(fontSize: 16),
                            textCapitalization: TextCapitalization.words,
                            textInputAction:
                                index != textEditingCont.length - 1 ? TextInputAction.next : TextInputAction.done,
                            decoration: InputDecoration(
                              constraints:
                                  textFormFieldBoxConstraints(maxWidth: MediaQuery.of(context).size.width - 32),
                              hintText: getstartWithEmail(IsEmail: widget.isEmail ?? false)[index].hintText,
                              prefixIcon: index != 2
                                  ? index == 1 && (widget.isEmail!)
                                      ? Icon(Icons.email)
                                      : prefixIcons[index]
                                  : IconButton(
                                      onPressed: () {
                                        passwordVisibility = !passwordVisibility;
                                        setState(() {});
                                      },
                                      icon: passwordVisibility ? Icon(Icons.lock_open_rounded) : Icon(Icons.lock),
                                    ),
                              suffixIcon: index != 2
                                  ? null
                                  : IconButton(
                                      onPressed: () {
                                        passwordVisibility = !passwordVisibility;
                                        setState(() {});
                                      },
                                      icon: Icon(passwordVisibility ? Icons.visibility : Icons.visibility_off)),
                            ),
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).requestFocus(focus[index + 1]);
                            }),
                      )),
                  Column(
                    children: [
                      Wrap(
                        spacing: 8,
                        direction: Axis.horizontal,
                        children: List.generate(
                          passwordValidationTabs.length,
                          (index) => Container(
                            width: 87,
                            height: 4,
                            decoration: BoxDecoration(color: Colors.white10),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Wrap(
                        children: List.generate(
                          passwordValidationTabs.length,
                          (index) => Container(
                            width: 95,
                            height: 14,
                            child: Text(
                              passwordValidationTabs[index],
                              textAlign: TextAlign.center,
                              style: secondaryTextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 28),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      print('Enter required fields');
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerificationScreen(
                          title: widget.title,
                        ),
                      ),
                    );
                  },
                  child: redirectionButtonContainer(width: MediaQuery.of(context).size.width - 32, title: 'Sign Up'),
                ),
                SizedBox(height: 14),
                GestureDetector(
                  onTap: () {},
                  child: RichText(
                    text: TextSpan(
                      style: secondaryTextStyle(),
                      children: [
                        TextSpan(text: 'By Sign Up, you accept '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: boldTextStyle(fontSize: 14, color: Colors.red),
                        ),
                        TextSpan(text: ' & '),
                        TextSpan(
                          text: 'Terms of Services',
                          style: boldTextStyle(fontSize: 14, color: Colors.red),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 60),
            Row(
              children: <Widget>[
                Expanded(
                  child: Divider(
                    endIndent: 8,
                    thickness: 3,
                  ),
                ),
                Text(
                  "Or select",
                  style: secondaryTextStyle(fontSize: 14),
                ),
                Expanded(
                  child: Divider(
                    indent: 8,
                    thickness: 3,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Wrap(
              spacing: 16,
              alignment: WrapAlignment.center,
              children: List.generate(
                3,
                (index) => CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.black38,
                  backgroundImage: AssetImage(
                    imageList[index],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: secondaryTextStyle(fontSize: 14, color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => SignInScreen(
                          signInWith: true,
                        ),
                      ),
                      (route) => false,
                    );
                  },
                  child: Text(
                    'Sign In',
                    style: boldTextStyle(color: Colors.red, fontSize: 14),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
