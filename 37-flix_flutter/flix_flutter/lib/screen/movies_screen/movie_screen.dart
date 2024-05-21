import 'package:flutter/material.dart';

import '../../model/image_data_model.dart';
import '../../utils/common_widgets.dart';
import '../video_screen.dart';
import 'movie_detail_screen.dart';

class MovieScreen extends StatefulWidget {
  String? title;
  MovieScreen({this.title});

  State<MovieScreen> createState() => MovieScreenState();
}

class MovieScreenState extends State<MovieScreen> {
  List<ImageDataModel> latestmoviesList = getlatestMovies();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: backButton(),
        ),
        title: Text(widget.title!, style: boldTextStyle(fontSize: 22)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                children: List.generate(latestmoviesList.length, (index) {
                  ImageDataModel movieImage = latestmoviesList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MovieDetailScreen(
                            index: index,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width - 32,
                      child: Wrap(
                        direction: Axis.horizontal,
                        spacing: 16,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          ClipRRect(
                            child: Image.asset(
                              movieImage.imageName!,
                              height: 150,
                              width: 110,
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          Wrap(
                            spacing: 8,
                            direction: Axis.vertical,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children: [
                              Text(
                                'Seasons ${index} ',
                                style: secondaryTextStyle(),
                              ),
                              Text(
                                movieImage.title!,
                                style: boldTextStyle(fontSize: 22),
                              ),
                              Text(
                                "${movieImage.genere!.join(" · ")}",
                                style: secondaryTextStyle(fontSize: 14),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    heroTag: 'movieSeries${index}',
                                    mini: true,
                                    elevation: 9,
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => VideoScreen(title: movieImage.title!),
                                        ),
                                      );
                                    },
                                    child: Icon(
                                      Icons.play_arrow_rounded,
                                      size: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width - 246,
                                  ),
                                  Wrap(
                                    spacing: 4,
                                    runAlignment: WrapAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.star_rate_rounded,
                                        color: Colors.yellow.shade700,
                                        size: 14,
                                      ),
                                      Text(
                                        movieImage.ratings!,
                                        textAlign: TextAlign.center,
                                        style: secondaryTextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
