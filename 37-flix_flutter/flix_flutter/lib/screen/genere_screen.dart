import 'package:flutter/material.dart';
import 'package:prokit_flutter/utils/common_widgets.dart';
import 'package:prokit_flutter/utils/config.dart';

import '../model/genere_data_model.dart';

class GenreScreen extends StatefulWidget {
  State<GenreScreen> createState() => GenreScreenState();
}

class GenreScreenState extends State<GenreScreen> {
  List<GenreDataModel> genreList = getGenreImage();

  void initState() {
    super.initState();
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
        title: Text('Genre ', textAlign: TextAlign.center, style: boldTextStyle(fontSize: 22)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Wrap(
              runSpacing: 16,
              spacing: 16,
              children: List.generate(
                genreList.length,
                (i) {
                  GenreDataModel genre = genreList[i];
                  return InkWell(
                    onTap: () {
                      genre.isSelected = !genre.isSelected;
                      setState(() {});
                    },
                    radius: defaultRadius,
                    borderRadius: BorderRadius.all(Radius.circular(defaultRadius)),
                    child: Container(
                      alignment: Alignment.center,
                      height: 80,
                      width: MediaQuery.of(context).size.width / 2 - 24,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(defaultRadius),
                        image: DecorationImage(
                          image: AssetImage(genre.imageName!),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(Colors.black26, BlendMode.dstATop),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: genre.isSelected ? Colors.red : Colors.transparent,
                              shape: BoxShape.circle,
                              border: Border.all(color: genre.isSelected ? Colors.transparent : Colors.white),
                            ),
                            child: Icon(
                              Icons.done,
                              size: 16,
                              color: genre.isSelected ? Colors.white : Colors.transparent,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Text(genre.title!, style: primaryTextStyle()),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: redirectionButtonContainer(
                title: 'Apply',
                width: MediaQuery.of(context).size.width - 32,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
