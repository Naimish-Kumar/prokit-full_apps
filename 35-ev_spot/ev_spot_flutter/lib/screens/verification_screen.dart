import 'dart:async';
import 'package:ev_spot_flutter/components/app_logo_image_component.dart';
import 'package:ev_spot_flutter/screens/home_screen.dart';
import 'package:ev_spot_flutter/utils/common.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  int _counter = 25;

  late Timer _timer;

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_counter > 0) {
        setState(() {
          _counter--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(elevation: 0, centerTitle: true, title: AppLogoImageComponent()),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Verification', style: boldTextStyle(fontSize: 22)),
              SizedBox(height: 6),
              Text('Enter verification code sent on given number', style: secondaryTextStyle(fontSize: 16)),
              SizedBox(height: 40),
              Text('Enter 6 digit OTP', style: primaryTextStyle()),
              SizedBox(height: 10),
              TextFormField(
                decoration: inputDecoration(context, hintText: 'Enter 6 digit OTP'),
                keyboardType: TextInputType.phone,
                cursorColor: Theme.of(context).colorScheme.primary,
                cursorWidth: 1,
                textInputAction: TextInputAction.done,
                maxLength: 6,
              ),
              SizedBox(height: 25),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    setState(() {
                      _timer.cancel();
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Text('Submit', style: primaryTextStyle(color: Colors.white)),
                  style: Theme.of(context).elevatedButtonTheme.style,
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('0:${_counter} min left', style: primaryTextStyle()),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _timer.cancel();
                        _counter = 25;
                        _startTimer();
                      });
                    },
                    child: Text('RESEND', style: primaryTextStyle(color: Theme.of(context).colorScheme.primary)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
