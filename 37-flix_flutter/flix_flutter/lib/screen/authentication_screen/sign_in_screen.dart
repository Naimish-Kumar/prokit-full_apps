import 'package:flutter/material.dart';
import 'package:prokit_flutter/screen/authentication_screen/reset_password_screen.dart';
import 'package:prokit_flutter/screen/dashboard_screens/dashboard_screen.dart';
import 'package:prokit_flutter/utils/common_widgets.dart';

import '../../utils/constants.dart';

class SignInScreen extends StatefulWidget {
  bool? signInWith;

  SignInScreen({this.signInWith});

  State<SignInScreen> createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  late GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late FocusNode curentFocusNode;
  bool passwordVisibility = false;
  bool isFormValidated = false;

  List<String> imageList = [FACEBOOK_LOGO, GOOGLE_LOGO, APPLE_LOGO];
  List<TextEditingController> textEditingCont = List.generate(2, (index) => TextEditingController());
  List<FocusNode> focus = List.generate(2, (index) => FocusNode());

  String? hintText;

  @override
  void initState() {
    curentFocusNode = FocusNode();
  }

  void dispose() {
    curentFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 72),
            Text(
              'Sign In',
              style: boldTextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Enter your user Information below or continue with one of your social account ',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.white60),
              ),
            ),
            SizedBox(height: 16),
            Form(
              key: formKey,
              child: Column(
                children: [
                  Wrap(
                    spacing: 16,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    direction: Axis.vertical,
                    children: [
                      TextFormField(
                        controller: textEditingCont[0],
                        focusNode: focus[0],
                        keyboardType: TextInputType.emailAddress,
                        cursorHeight: 24,
                        style: primaryTextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          constraints: textFormFieldBoxConstraints(maxWidth: MediaQuery.of(context).size.width - 32),
                          hintText: 'sofia.taylor@gmail.com',
                          prefixIcon: Icon(Icons.email_rounded),
                        ),
                      ),
                      TextFormField(
                        controller: textEditingCont[1],
                        focusNode: focus[1],
                        style: primaryTextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          constraints: textFormFieldBoxConstraints(maxWidth: MediaQuery.of(context).size.width - 32),
                          hintText: 'Password@123',
                          prefixIcon: IconButton(
                            onPressed: () {
                              passwordVisibility = !passwordVisibility;
                              setState(() {});
                            },
                            icon: passwordVisibility ? Icon(Icons.lock_open_rounded) : Icon(Icons.lock),
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                passwordVisibility = !passwordVisibility;
                                setState(() {});
                              },
                              icon: Icon(passwordVisibility ? Icons.visibility : Icons.visibility_off)),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ResetPasswordScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Forgot password?',
                          style: boldTextStyle(fontSize: 12, color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        print('Enter required fields');
                      }
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashboardScreen(),
                        ),
                        (route) => false,
                      );
                    },
                    child: redirectionButtonContainer(title: 'Sign In', width: MediaQuery.of(context).size.width - 32),
                  ),
                ],
              ),
            ),
            SizedBox(height: 200),
            Row(
              children: <Widget>[
                Expanded(
                  child: Divider(
                    indent: 16,
                    endIndent: 8,
                    thickness: 3,
                  ),
                ),
                Text(
                  "Or Select",
                  style: TextStyle(color: Colors.white70),
                ),
                Expanded(
                  child: Divider(
                    indent: 8,
                    endIndent: 16,
                    thickness: 3,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
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
          ],
        ),
      ),
    );
  }
}
