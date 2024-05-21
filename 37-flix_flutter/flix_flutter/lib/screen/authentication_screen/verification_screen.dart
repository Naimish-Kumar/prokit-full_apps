import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prokit_flutter/utils/common_widgets.dart';

import 'welcome_screen.dart';

class VerificationScreen extends StatefulWidget {
  String? title;

  VerificationScreen({this.title});

  State<VerificationScreen> createState() => VerificationScreenState();
}

class VerificationScreenState extends State<VerificationScreen> {
  late GlobalKey<FormState> verificationFormKey;
  Timer? timer;
  Duration duration = Duration(minutes: 2);
  bool reset = false;
  var codeLength = 5;

  void initState() {
    super.initState();
    verificationFormKey = GlobalKey<FormState>();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => timeCalculation());
  }

  void stopTimer() {
    timer!.cancel();
    setState(() {});
  }

  void resetTimer() {
    stopTimer();
    setState(() {
      duration = Duration(minutes: 2);
    });
  }

  void timeCalculation() {
    setState(() {
      final minus = 1;
      final seconds = duration.inSeconds - minus;
      if (seconds < 0) {
        timer!.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String time(int n) => n.toString().padLeft(2, '0');
    final min = time(duration.inMinutes.remainder(60));
    final seconds = time(duration.inSeconds.remainder(60));
    bool validated = false;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: backButton(),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(bottom: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Wrap(
                  direction: Axis.vertical,
                  spacing: 8,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      'Verification code',
                      style: boldTextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Please type the verification code we sent it to your \n${widget.title!}',
                      textAlign: TextAlign.center,
                      style: secondaryTextStyle(fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 16,
                  children: List.generate(
                    codeLength,
                    (index) => TextFormField(
                      keyboardType: TextInputType.number,
                      textInputAction: index != codeLength - 1 ? TextInputAction.next : TextInputAction.done,
                      cursorHeight: 28,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        focusColor: Colors.red,
                        filled: true,
                        fillColor: validated ? Colors.red : Colors.transparent,
                        constraints: textFormFieldBoxConstraints(
                          maxHeight: 50,
                          maxWidth: 50,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      inputFormatters: [LengthLimitingTextInputFormatter(1), FilteringTextInputFormatter.digitsOnly],
                      validator: (value) {
                        value!.isNotEmpty ? validated = true : validated = false;
                        return null;
                      },
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          FocusScope.of(context).requestFocus();
                        }
                      },
                      onTap: () {
                        FocusScope.of(context).hasPrimaryFocus
                            ? FocusScope.of(context).unfocus()
                            : FocusScope.of(context).requestFocus();
                      },
                      onFieldSubmitted: (v) {
                        FocusScope.of(context).requestFocus();
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                GestureDetector(
                  onTap: () {
                    resetTimer();
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: timer!.isActive ? 'After ' : "Didn't received code?",
                            style: secondaryTextStyle(color: Colors.white)),
                        TextSpan(
                          text: timer!.isActive ? '$min : $seconds' : '',
                          style: primaryTextStyle(fontSize: 14, color: Colors.red),
                        ),
                        TextSpan(
                          text: timer!.isActive ? ' you can request for new code' : ' Resend',
                          style: secondaryTextStyle(color: timer!.isActive ? Colors.white : Colors.red),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WelcomeScreen(title: widget.title),
                  ),
                );
              },
              child: redirectionButtonContainer(
                  title: 'Verify your ${widget.title}', width: MediaQuery.of(context).size.width - 32),
            ),
          ],
        ),
      ),
    );
  }
}
