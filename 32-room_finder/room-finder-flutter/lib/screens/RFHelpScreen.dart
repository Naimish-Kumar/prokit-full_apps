import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:room_finder_flutter/components/RFFAQComponent.dart';
import 'package:room_finder_flutter/models/RoomFinderModel.dart';
import 'package:room_finder_flutter/utils/RFDataGenerator.dart';
import 'package:room_finder_flutter/utils/RFWidget.dart';

class RFHelpScreen extends StatelessWidget {
  final List<RoomFinderModel> faqData = faqList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarWidget(context, showLeadingIcon: false, title: 'Help', roundCornerShape: true, appBarHeight: 80),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Frequent Asked Questions', style: boldTextStyle(size: 18)).paddingOnly(left: 16, top: 24),
            ListView.builder(
              padding: EdgeInsets.only(right: 16, left: 16, bottom: 16, top: 24),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: 9,
              itemBuilder: (BuildContext context, int index) {
                RoomFinderModel data = faqData[index % faqData.length];
                return RFFAQComponent(faqData: data);
              },
            ),
          ],
        ),
      ),
    );
  }
}
