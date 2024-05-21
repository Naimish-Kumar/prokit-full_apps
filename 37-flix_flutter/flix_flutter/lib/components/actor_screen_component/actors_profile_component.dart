import 'package:flutter/material.dart';
import 'package:prokit_flutter/utils/common_widgets.dart';

import '../../model/actor_data_model.dart';

class ActorsProfileComponent extends StatefulWidget {
  final ActorDataModel actorData;

  ActorsProfileComponent({required this.actorData});

  State<ActorsProfileComponent> createState() => ActorsProfileComponentState();
}

class ActorsProfileComponentState extends State<ActorsProfileComponent> {
  String? follow = 'Follow';
  List<String> dashboard = ['Followers', 'Rank', 'Awards'];

  void initState() {
    super.initState();
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
              image: AssetImage(
                widget.actorData.imageName!,
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.white10,
                BlendMode.modulate,
              ),
            ),
          ),
        ),
        Wrap(
          direction: Axis.vertical,
          spacing: 8,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(56),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage(widget.actorData.imageName!), fit: BoxFit.cover),
              ),
            ),
            Text(
              widget.actorData.title!,
              textAlign: TextAlign.center,
              style: boldTextStyle(fontSize: 20),
            ),
            Text(
              "${widget.actorData.workAs!.join(" · ")}",
              style: secondaryTextStyle(),
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
        ),
        Positioned(
          bottom: 16,
          child: Wrap(
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
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Text(
                    '${1000 - index * 5}',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  )
                ],
              );
            }),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).viewPadding.top + 8,
          left: 16,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: backButton(backgroundColor: Colors.black26),
          ),
        )
      ],
    );
  }
}
