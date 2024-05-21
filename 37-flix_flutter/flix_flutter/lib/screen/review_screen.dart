import 'package:flutter/material.dart';
import 'package:prokit_flutter/utils/common_widgets.dart';
import 'package:prokit_flutter/utils/config.dart';

import '../components/review_component.dart';
import '../model/movie_reviews_model.dart';

class ReviewScreen extends StatefulWidget {
  final MovieDataModel movieReview;
  final int index;

  ReviewScreen({required this.index, required this.movieReview});

  State<ReviewScreen> createState() => ReviewScreenState();
}

class ReviewScreenState extends State<ReviewScreen> {
  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: backButton(),
        ),
        title: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: '${widget.movieReview.title}/',
              style: boldTextStyle(fontSize: 22, color: Colors.white60),
            ),
            TextSpan(text: 'Reviews', style: boldTextStyle(fontSize: 22))
          ]),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              direction: Axis.horizontal,
              children: [],
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Top Reviews',
              textAlign: TextAlign.center,
              style: boldTextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Container(
              width: MediaQuery.of(context).size.width - 32,
              padding: EdgeInsets.all(16),
              decoration:
                  BoxDecoration(color: Colors.grey.shade800, borderRadius: BorderRadius.circular(defaultRadius)),
              child: ReviewComponent(
                movieReview: widget.movieReview,
                reviewIndex: 0,
                reviewsOfIndex: widget.index,
              ),
            ),
            SizedBox(
              height: 28,
            ),
            Wrap(
              spacing: 16,
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  'Other Reviews',
                  textAlign: TextAlign.center,
                  style: boldTextStyle(fontSize: 20),
                ),
                Wrap(
                  direction: Axis.vertical,
                  spacing: 16,
                  children: List.generate(widget.movieReview.reviews!.length - 1, (index) {
                    return Container(
                      width: MediaQuery.of(context).size.width - 32,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade800, borderRadius: BorderRadius.circular(defaultRadius)),
                      child: ReviewComponent(
                        reviewIndex: index + 1,
                        reviewsOfIndex: widget.index,
                        movieReview: widget.movieReview,
                      ),
                    );
                  }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

/*
List<String>countLines(String line){
    int linecount=0;
    List<String> sentence=[];
    while(line.isNotEmpty)
      {
        sentence= line.split("[!?.:]+");
        linecount += sentence.length;
      }
    return sentence;
  }
List<String> lines=countLines(movieReview.reviews![index]);
    int linecount=lines.length;
    int min=linecount~/2;
    if(linecount>3)
      {
        for(int i=0;i<linecount;i++)
        {
          while(i<3)
            firstpart+=lines[i];
          nextpart+=lines[i];
        }
      }
    else{
      for(int i=0;i<linecount;i++)
      {
          firstpart+=lines[i];
          nextpart='';
      }
    }*/
