import 'package:ev_spot_flutter/utils/common.dart';
import 'package:ev_spot_flutter/utils/data_provider.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.black), backgroundColor: Colors.transparent, elevation: 0),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Privacy policy', style: boldTextStyle(fontSize: 22)),
            SizedBox(height: 30),
            Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry.', style: primaryTextStyle(), textAlign: TextAlign.justify),
            SizedBox(height: 30),
            Text('Privacy Policies', style: secondaryTextStyle(fontSize: 16)),
            ListView.builder(
              itemCount: policyText.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                String policyData = policyText[index];
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: const EdgeInsets.only(top: 4), child: Icon(Icons.circle, size: 10, color: Theme.of(context).colorScheme.primary)),
                      SizedBox(width: 16),
                      Expanded(child: Text('$policyData', textAlign: TextAlign.justify, style: primaryTextStyle())),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
