import 'package:flutter/material.dart';
import 'package:prokit_flutter/utils/common_widgets.dart';

import '../model/actor_data_model.dart';

class GallaryScreen extends StatefulWidget {
  final ActorDataModel actorGallary;

  GallaryScreen({required this.actorGallary});

  State<GallaryScreen> createState() => GallaryScreenState();
}

class GallaryScreenState extends State<GallaryScreen> with TickerProviderStateMixin {
  late TabController tabController;

  void initState() {
    super.initState();

    // SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
  }

  void dispose() {
    super.dispose();
  }

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
        title: Text(
          widget.actorGallary.title!,
          style: boldTextStyle(fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: List.generate(widget.actorGallary.imageList!.length, (index) {
              return Container(
                width: MediaQuery.of(context).size.width / 2 - 24,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    widget.actorGallary.imageList![index],
                    width: MediaQuery.of(context).size.width / 4 - 32,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
