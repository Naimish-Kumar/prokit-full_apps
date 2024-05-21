import 'package:flutter/material.dart';

import '../../model/actor_data_model.dart';
import '../../screen/actor_screens/actor_detail_screen.dart';
import '../../screen/actor_screens/actors_screen.dart';
import '../../utils/common_widgets.dart';

class MoviesCastComponent extends StatefulWidget {
  State<MoviesCastComponent> createState() => MoviesCastComponentState();
}

class MoviesCastComponentState extends State<MoviesCastComponent> {
  get actorsDetails => getActorsDetail();

  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 8,
      children: [
        titleRowItem(
          title: 'Cast',
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ActorsScreen(),
              ),
            );
          },
          isSeeAll: true,
        ),
        SingleChildScrollView(
          padding: EdgeInsets.only(left: 16, right: 16),
          scrollDirection: Axis.horizontal,
          child: Wrap(
            spacing: 16,
            children: List.generate(actorsDetails.length, (index) {
              ActorDataModel actorImage = actorsDetails[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ActorDetailScreen(
                        actorData: actorsDetails[index],
                      ),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 4 - 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        child: Image.asset(
                          actorImage.imageName!,
                          height: MediaQuery.of(context).size.height * 0.12,
                          width: MediaQuery.of(context).size.width / 4 - 20,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      SizedBox(height: 8),
                      Text(
                        actorImage.title!,
                        textAlign: TextAlign.center,
                        style: primaryTextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
