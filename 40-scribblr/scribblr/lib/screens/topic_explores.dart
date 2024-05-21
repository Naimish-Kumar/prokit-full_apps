import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:scribblr/components/text_styles.dart';

import '../components/explore_component.dart';
import '../main.dart';
import '../models/article_model.dart';

class TopicExploreScreen extends StatefulWidget {
  final String title;
  final List<ArticleModel> articleList;

  const TopicExploreScreen({super.key, required this.title, required this.articleList});

  @override
  State<TopicExploreScreen> createState() => _TopicExploreScreenState();
}

class _TopicExploreScreenState extends State<TopicExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          surfaceTintColor: appStore.isDarkMode ? scaffoldDarkColor : context.scaffoldBackgroundColor,
          iconTheme: IconThemeData(color: appStore.isDarkMode ? Colors.white : Colors.black),
          title: Text(widget.title, style: primarytextStyle(color: appStore.isDarkMode ? Colors.white : Colors.black)),
          backgroundColor: appStore.isDarkMode ? scaffoldDarkColor : context.scaffoldBackgroundColor,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Wrap(
            runAlignment: WrapAlignment.center,
            runSpacing: 16,
            spacing: 16,
            children: widget.articleList
                .validate()
                .map(
                  (e) => ExploreComponent(width: context.width() / 2 - 36, height: 100, articleResponseData: e),
                )
                .toList(),
          ),
        ),
      );
    });
  }
}
