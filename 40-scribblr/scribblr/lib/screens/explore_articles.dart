import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:scribblr/utils/constant.dart';

import '../components/new_article_component.dart';
import '../main.dart';
import '../models/article_model.dart';
import '../utils/colors.dart';

class ExploreArticles extends StatefulWidget {
  final List<ArticleModel>? articleList;

  final ArticleModel exploreData;

  ExploreArticles({required this.exploreData, this.articleList});

  @override
  State<ExploreArticles> createState() => _ExploreArticlesState();
}

class _ExploreArticlesState extends State<ExploreArticles> {
  List<ArticleResponse> articleList = getDiscoverResponse();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          surfaceTintColor:
              appStore.isDarkMode ? scaffoldDarkColor : context.scaffoldBackgroundColor,
          iconTheme: IconThemeData(color: appStore.isDarkMode ? Colors.white : Colors.black),
          backgroundColor:
              appStore.isDarkMode ? scaffoldDarkColor : context.scaffoldBackgroundColor,
          title: Text(
            widget.exploreData.title.validate(),
            style: primaryTextStyle(color: appStore.isDarkMode ? Colors.white : Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ...articleList.map(
                (e) {
                  if (e.listType == new_article)
                    return Column(
                      children: [
                        Container(
                          height: 160,
                          decoration: BoxDecoration(
                            color: borderColor,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(widget.exploreData.imageAsset.validate())),
                          ),
                        ),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: e.articleList.validate().length,
                          itemBuilder: (context, index) {
                            return NewArticleComponent(
                                newArticleResponseData: e.articleList.validate()[index]);
                          },
                        ),
                      ],
                    );
                  else
                    return Offstage();
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
