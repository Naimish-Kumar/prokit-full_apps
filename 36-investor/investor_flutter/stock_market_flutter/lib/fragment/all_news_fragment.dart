import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stock_investment_flutter/component/news_component.dart';
import 'package:stock_investment_flutter/main.dart';
import 'package:stock_investment_flutter/model/stock_invest_model.dart';
import 'package:stock_investment_flutter/utils/colors.dart';
import 'package:stock_investment_flutter/utils/common.dart';
import 'package:stock_investment_flutter/utils/data_generator.dart';

// ignore: must_be_immutable
class AllNewsFragment extends StatefulWidget {
  bool? showBackIcon;

  AllNewsFragment({this.showBackIcon});

  @override
  State<AllNewsFragment> createState() => _AllNewsFragmentState();
}

class _AllNewsFragmentState extends State<AllNewsFragment> {
  final List<StockInvestModel> stockNewsData = stockNewsList();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    setStatusBarColor(appStore.isDarkModeOn ? black : white);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
    setStatusBarColor(primaryColor, delayInMilliSeconds: 400);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarWidget(context, title: "All Stock News", changeIcon: true, showLeadingIcon: widget.showBackIcon.validate()),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 15,
        padding: EdgeInsets.all(16),
        itemBuilder: (_, index) => NewsComponent(stockNewsData[index % stockNewsData.length]).paddingOnly(bottom: 16),
      ),
    );
  }
}
