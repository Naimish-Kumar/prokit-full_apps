import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:medium_prokit/utils/MColors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MPostDetailsScreen extends StatefulWidget {
  static String tag = '/MPostDetailsScreen';

  @override
  MPostDetailsScreenState createState() => MPostDetailsScreenState();
}

class MPostDetailsScreenState extends State<MPostDetailsScreen> with SingleTickerProviderStateMixin {
  WebViewController _webViewController = WebViewController();
  double? contentHeight = 0;

  ScrollController _scrollController = ScrollController();
  bool isScrollingDown = false;
  bool _show = true;

  @override
  void initState() {
    super.initState();

    init();
  }

  init() async {
    String fileText = await rootBundle.loadString("assets/medium/mediumhtmlpage.html");
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(fileText))
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          _loadHtmlFromAssets();
        },
        onPageFinished: (url) async {
          if (_webViewController != null) {
            contentHeight = double.tryParse(_webViewController.runJavaScriptReturningResult("document.documentElement.scrollHeight;") as String);

            setState(() {});
          }
        },
      ));

    myScroll();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  void showBottomContainer() {
    setState(() {
      _show = true;
    });
  }

  void hideBottomContainer() {
    setState(() {
      _show = false;
    });
  }

  _loadHtmlFromAssets() async {
    String fileText = await rootBundle.loadString("assets/medium/mediumhtmlpage.html");
    _webViewController.loadRequest(Uri.dataFromString(fileText, mimeType: 'text/html', encoding: Encoding.getByName('utf-8')));
  }

  void myScroll() async {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          hideBottomContainer();
        }
      }
      if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          showBottomContainer();
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mGreyColor,
      bottomNavigationBar: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: context.width(),
        height: _show ? 50 : 0,
        color: black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(icon: Icon(MaterialCommunityIcons.hand_okay), onPressed: () {}, color: Colors.grey),
                IconButton(icon: Icon(MaterialCommunityIcons.bookmark_outline), onPressed: () {}, color: Colors.grey),
                IconButton(icon: Icon(MaterialCommunityIcons.share_variant), onPressed: () {}, color: Colors.grey),
              ],
            ),
            IconButton(icon: Icon(FontAwesome.sort_alpha_asc), onPressed: () {}, color: Colors.grey),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: white),
            onPressed: () {
              finish(context);
            }),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          height: contentHeight != null ? contentHeight : 300,
          child: WebViewWidget(
            controller: _webViewController,
          ),
        ),
      ),
    );
  }
}
