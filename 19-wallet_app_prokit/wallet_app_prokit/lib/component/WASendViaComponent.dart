import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wallet_app_prokit/model/WalletAppModel.dart';
import 'package:wallet_app_prokit/utils/WADataGenerator.dart';
import 'package:wallet_app_prokit/utils/WAWidgets.dart';

import '../main.dart';

class WASendViaComponent extends StatefulWidget {
  static String tag = '/WASendViaComponent';

  final WACardModel? item;

  WASendViaComponent({this.item});

  @override
  WASendViaComponentState createState() => WASendViaComponentState();
}

class WASendViaComponentState extends State<WASendViaComponent> {
  List<WACardModel> sendViaCardList = waSendViaCardList();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.circular(4), backgroundColor: widget.item!.color!),
          padding: EdgeInsets.all(4),
          width: 60,
          height: 40,
          child: waCommonCachedNetworkImage('${widget.item!.image}', fit: BoxFit.fill, color: Colors.white),
        ),
        16.width,
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Bank Visa Card', style: boldTextStyle(size: 16, color: appStore.isDarkModeOn ? white : black), maxLines: 1),
            Text(widget.item!.cardNumber.validate(), style: secondaryTextStyle(size: 14, color: gray)),
          ],
        ),
      ],
    );
  }
}
