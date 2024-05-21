import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prokit_flutter/utils/common_widgets.dart';

import '../utils/videosdata.dart';

class VideoScreen extends StatefulWidget {
  String? title;

  VideoScreen({
    this.title,
  });

  State<VideoScreen> createState() => VideoScreenState();
}

class VideoScreenState extends State<VideoScreen> {
  List<VideoDataModel> movieClips = getMovieClips();

  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }

  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int currentspeed = 1;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 20,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    widget.title!,
                    style: boldTextStyle(fontSize: 18),
                  ),
                ),
                Wrap(
                  direction: Axis.horizontal,
                  spacing: 16,
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    PopupMenuButton(
                      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                      itemBuilder: (BuildContext context) => [
                        ...List.generate(3, (index) {
                          return PopupMenuItem(
                            value: currentspeed,
                            onTap: () {
                              currentspeed = index;
                            },
                            child: Text(
                              '${index + 0.5}x',
                              style: primaryTextStyle(),
                            ),
                          );
                        })
                      ],
                      child: Text(
                        '1X',
                        style: secondaryTextStyle(),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(Icons.cast),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(Icons.timer_outlined),
                    ),
                    PopupMenuButton(
                      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                      itemBuilder: (context) => [
                        ...List.generate(
                          5,
                          (index) => PopupMenuItem(
                            height: 32,
                            value: index,
                            onTap: () {},
                            child: Wrap(
                              spacing: 32,
                              children: [
                                Text('Season ${index + 1}'),
                                GestureDetector(
                                  onTap: () {},
                                  child: Icon(Icons.expand_more_rounded),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: MediaQuery.of(context).size.width / 4 - 144,
                  children: [
                    Text(
                      '00:23:52',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white60,
                      ),
                    ),
                    Container(
                      height: 6,
                      width: MediaQuery.of(context).size.width * 0.70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white10,
                      ),
                    ),
                    Text(
                      '00:47:10',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white60,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: MediaQuery.of(context).size.width / 4 - 32,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.lock,
                        size: 30,
                        color: Colors.white70,
                      ),
                    ),
                    Wrap(
                      spacing: MediaQuery.of(context).size.width / 4 - 160,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.restart_alt_rounded,
                                size: 32,
                                color: Colors.white60,
                              ),
                            ),
                            Icon(
                              Icons.timer_3_rounded,
                              color: Colors.white70,
                              size: 12,
                            )
                          ],
                        ),
                        Wrap(
                          spacing: 8,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.skip_previous_rounded,
                                size: 32,
                                color: Colors.white70,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.play_arrow_rounded,
                                size: 44,
                                color: Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.skip_next_rounded,
                                size: 32,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.refresh_rounded,
                                size: 34,
                                color: Colors.white60,
                              ),
                            ),
                            Icon(
                              Icons.timer_3_rounded,
                              color: Colors.white70,
                              size: 12,
                            )
                          ],
                        ),
                      ],
                    ),
                    Wrap(
                      spacing: 16,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 25,
                            width: 25,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                width: 2,
                                color: Colors.white60,
                              ),
                            ),
                            child: Icon(
                              Icons.download_rounded,
                              size: 18,
                              color: Colors.white60,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 25,
                            width: 25,
                            alignment: Alignment.bottomRight,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                width: 2,
                                color: Colors.white60,
                              ),
                            ),
                            child: Icon(
                              Icons.crop_square_rounded,
                              size: 14,
                              color: Colors.white60,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.movie_outlined,
                            size: 28,
                            color: Colors.white60,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 8)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget popupMenuItems() {
    int speedCount = 3;
    return Wrap(
      children: List.generate(speedCount, (index) {
        return PopupMenuItem(
          height: 16,
          child: Text(
            '${index}x',
            style: TextStyle(fontSize: 12, color: Colors.white70),
          ),
        );
      }),
    );
  }
} /*padding: const EdgeInsets.only(top: 8, bottom: 8.0, right: 16, left: 16),*/

/**/
