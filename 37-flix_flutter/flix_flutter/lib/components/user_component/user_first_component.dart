import 'package:flutter/material.dart';
import 'package:prokit_flutter/model/movie_reviews_model.dart';
import 'package:prokit_flutter/utils/common_widgets.dart';

class UserFirstComponent extends StatefulWidget {
  int? userDetailOfIndex;
  int? index;

  UserFirstComponent({this.index, this.userDetailOfIndex});

  State<UserFirstComponent> createState() => UserFirstComponentState();
}

class UserFirstComponentState extends State<UserFirstComponent> {
  String? follow = 'Follow';
  List<String> dashboard = ['Followers', 'Following'];
  List<MovieDataModel> movieReviews = getMovieReviews();
  late MovieDataModel userImage;
  String? userImageName;
  String? userName;
  String? _userName;

  void initState() {
    super.initState();
    userImage = movieReviews[widget.userDetailOfIndex!];
    userImageName = userImage.userImageNames![widget.index!];
    userName = userImage.names![widget.index!];
    _userName = userImage.usernames![widget.index!];
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 350,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(userImageName!),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.white10,
                BlendMode.modulate,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 16,
          child: Wrap(
            spacing: 24,
            direction: Axis.vertical,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            children: [
              Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                children: [
                  Wrap(
                    spacing: 8,
                    direction: Axis.vertical,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(56),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, image: DecorationImage(image: AssetImage(this.userImageName!))),
                      ),
                      Text(
                        this.userName!,
                        textAlign: TextAlign.center,
                        style: boldTextStyle(fontSize: 20),
                      ),
                      GestureDetector(
                        onTap: () {
                          follow == 'Follow' ? follow = 'Following' : follow = 'Follow';
                          setState(() {});
                        },
                        child: Container(
                          width: 100,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(4)),
                          child: Text(
                            follow!,
                            style: boldTextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Wrap(
                spacing: 64,
                children: List.generate(dashboard.length, (index) {
                  return Wrap(
                    direction: Axis.vertical,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          dashboard[index],
                          style: primaryTextStyle(),
                        ),
                      ),
                      Text(
                        '${1000 - index * 5}',
                        style: secondaryTextStyle(),
                      )
                    ],
                  );
                }),
              )
            ],
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).viewPadding.top + 8,
          left: 16,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: backButton(backgroundColor: Colors.black26),
              ),
              SizedBox(width: 100),
              Text(
                '@${_userName}',
                textAlign: TextAlign.center,
                style: boldTextStyle(fontSize: 16, color: Colors.white60),
              )
            ],
          ),
        ),
      ],
    );
  }
}
