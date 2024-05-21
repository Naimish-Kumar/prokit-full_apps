import 'package:flutter/material.dart';
import 'package:prokit_flutter/screen/dashboard_screens/dashboard_screen.dart';
import 'package:prokit_flutter/utils/common_widgets.dart';

class PaymentStatusScreen extends StatefulWidget {
  String? status;
  PaymentStatusScreen({this.status});
  State<PaymentStatusScreen> createState() => PaymentStatusScreenState();
}

class PaymentStatusScreenState extends State<PaymentStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.close,
            size: 28,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                ),
                child: Text(
                  'Payment ${widget.status}',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(color: Colors.white60, fontSize: 18),
                          children: [
                            TextSpan(
                                text: 'Your Premium Plan has been completed\n',
                                style: TextStyle(color: Colors.white60, fontSize: 18)),
                            TextSpan(
                              text: 'succesfully and your',
                              style: TextStyle(color: Colors.white60, fontSize: 18),
                              children: [
                                TextSpan(
                                  text: ' Premium Plan',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.yellow.shade800,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(text: ' is now \nactivated')
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => DashboardScreen(),
                ),
                (route) => false,
              );
            },
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.90,
              margin: EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Colors.red),
              child: Text(
                'Back to Home',
                style: boldTextStyle(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
