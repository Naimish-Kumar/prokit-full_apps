import 'package:flutter/material.dart';
import 'package:prokit_flutter/screen/movies_screen/movie_detail_screen.dart';
import 'package:prokit_flutter/screen/video_screen.dart';
import 'package:prokit_flutter/utils/common_widgets.dart';

import '../../../model/image_data_model.dart';
import '../../../utils/videosdata.dart';

class MoviesBannerComponent extends StatefulWidget {
  State<MoviesBannerComponent> createState() => MoviesBannerComponentState();
}

class MoviesBannerComponentState extends State<MoviesBannerComponent> {
  int currentIndex = 0;
  late PageController pageController;
  List<ImageDataModel> posterList = getPoster();
  List<VideoDataModel> movieClips = getMovieClips();

  void initState() {
    super.initState();
    pageController = PageController();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, Colors.black87],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.43,
            child: PageView.builder(
              onPageChanged: (value) {
                currentIndex = value;
                setState(() {});
              },
              controller: pageController,
              itemCount: posterList.length,
              itemBuilder: (context, int index) {
                ImageDataModel poster = posterList[index];
                return Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.transparent, Colors.black87],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          image: DecorationImage(
                            image: AssetImage(poster.imageName!),
                            fit: BoxFit.cover,
                            //colorFilter: ColorFilter.mode(Colors.white10, BlendMode.modulate),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MovieDetailScreen(index: index),
                          ),
                        );
                      },
                    ),
                    Container(
                      height: 80,
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.only(left: 16, right: 16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.transparent, Colors.black87],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(poster.title!, style: boldTextStyle(fontSize: 28), textAlign: TextAlign.left),
                                    Text("${poster.genere!.join(" · ")}", style: secondaryTextStyle()),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => VideoScreen(
                                        title: poster.title!,
                                        // videoTitle:movieClips[index].videoTitle,
                                      ),
                                    ),
                                  );
                                },
                                child: customFloatingButton(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Row(
            children: [
              SizedBox(width: 16),
              Wrap(
                spacing: 4,
                children: [
                  ...List.generate(
                    posterList.length,
                    (index) => customDots(currentIndex, index),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
