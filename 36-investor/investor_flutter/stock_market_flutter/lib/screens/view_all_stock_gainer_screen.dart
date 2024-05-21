import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stock_investment_flutter/component/watch_list_component.dart';
import 'package:stock_investment_flutter/main.dart';
import 'package:stock_investment_flutter/model/stock_invest_model.dart';
import 'package:stock_investment_flutter/utils/common.dart';
import 'package:stock_investment_flutter/utils/data_generator.dart';

class ViewAllStockGainerScreen extends StatefulWidget {
  @override
  State<ViewAllStockGainerScreen> createState() => _ViewAllStockGainerScreenState();
}

class _ViewAllStockGainerScreenState extends State<ViewAllStockGainerScreen> {
  final List<StockInvestModel> watchData = watchList();

  void initState() {
    super.initState();
    init();
  }

  void init() async {
//
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
    setStatusBarColor(appStore.isDarkModeOn ? black : white);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarWidget(context, title: "All Stock gainer", changeIcon: true),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 20,
        padding: EdgeInsets.all(8),
        itemBuilder: (_, index) => WatchListComponent(watchData[index % watchData.length]).paddingOnly(bottom: 16),
      ).paddingSymmetric(horizontal: 8),
    );
  }
}
