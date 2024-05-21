import 'package:flutter/material.dart';

import '../../utils/common_widgets.dart';
import '../../model/movie_reviews_model.dart';

class MoviesAboutComponent extends StatefulWidget {
  final MovieDataModel movieAbout;
  MoviesAboutComponent({required this.movieAbout});

  State<MoviesAboutComponent> createState() => MoviesAboutComponentState();
}

class MoviesAboutComponentState extends State<MoviesAboutComponent> {
  String? defaultText;

  late String firstpart;
  late String nextpart;
  bool readMore = false;

  void initState() {
    super.initState();

    defaultText = widget.movieAbout.about;
    if (defaultText!.length > 250) {
      firstpart = defaultText!.substring(0, 250);
      nextpart = defaultText!.substring(250, defaultText!.length);
    } else {
      firstpart = defaultText!.substring(0, defaultText!.length);
      nextpart = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: Wrap(
        runSpacing: 8,
        children: [
          Text(
            'Story',
            style: boldTextStyle(fontSize: 20),
          ),
          nextpart.isNotEmpty
              ? Wrap(
                  alignment: WrapAlignment.end,
                  children: [
                    Text(
                      readMore ? (firstpart + nextpart) : (firstpart + " ..."),
                      textAlign: TextAlign.justify,
                      style: secondaryTextStyle(fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: () {
                        readMore = !readMore;
                        setState(() {});
                      },
                      child: Text(
                        readMore ? 'Less' : 'More',
                        textAlign: TextAlign.left,
                        style: boldTextStyle(fontSize: 12, color: Colors.red),
                      ),
                    ),
                  ],
                )
              : Text(
                  firstpart,
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
        ],
      ),
    );
  }
}
