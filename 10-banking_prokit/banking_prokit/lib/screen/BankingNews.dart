import 'package:banking_prokit/main.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:banking_prokit/model/BankingModel.dart';
import 'package:banking_prokit/utils/BankingColors.dart';
import 'package:banking_prokit/utils/BankingDataGenerator.dart';
import 'package:banking_prokit/utils/BankingStrings.dart';

class BankingNews extends StatefulWidget {

  @override
  _BankingNewsState createState() => _BankingNewsState();
}

class _BankingNewsState extends State<BankingNews> {
  late List<BankingShareInfoModel> mList1;

  @override
  void initState() {
    super.initState();
    mList1 = bankingNewsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              30.height,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.chevron_left,
                    size: 30,
                    color: appStore.isDarkModeOn ? white : Banking_blackColor,
                  ).onTap(
                    () {
                      finish(context);
                    },
                  ),
                  30.height,
                  Text(Banking_lbl_News, style: boldTextStyle(size: 32)),
                ],
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: mList1.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) => Container(
                  margin: EdgeInsets.only(bottom: 32),
                  decoration: boxDecorationWithShadow(
                    boxShadow: defaultBoxShadow(),
                    backgroundColor: context.cardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Cy Captial bank give a giftbox for new customers\nwho create account',
                        style: primaryTextStyle(),
                      ),
                      Image.asset(mList1[index].icon, height: 150, width: 150, fit: BoxFit.cover),
                      Text(Banking_lbl_Walk1SubTitle, style: secondaryTextStyle()),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
