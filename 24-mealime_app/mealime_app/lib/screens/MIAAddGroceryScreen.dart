import 'package:flutter/material.dart';
import 'package:mealime_app/main.dart';
import 'package:mealime_app/models/MIASelectOptionsModel.dart';
import 'package:mealime_app/utils/MIAColors.dart';
import 'package:mealime_app/utils/MIADataGenerator.dart';
import 'package:nb_utils/nb_utils.dart';

class MIAAddGroceryScreen extends StatefulWidget {
  List<MIASelectOptionsModel> groceriesList;

  MIAAddGroceryScreen({required this.groceriesList});

  @override
  State<MIAAddGroceryScreen> createState() => _MIAAddGroceryScreenState();
}

class _MIAAddGroceryScreenState extends State<MIAAddGroceryScreen> {
  List<MIASelectOptionsModel> list = getAddGroceryList();

  var form_key = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        30.height,
        Form(
          key: form_key,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(borderRadius: radius(8), color: appStore.isDarkModeOn ? context.cardColor : miaContainerSecondaryColor),
                child: TextField(
                  controller: nameController,
                  autofocus: true,
                  cursorColor: miaPrimaryColor,
                  decoration: InputDecoration(hintText: 'Add Something...', border: InputBorder.none),
                ),
              ).flexible(flex: 2),
              16.width,
              Text('Done', style: primaryTextStyle(color: miaPrimaryColor)).onTap(() {
                if (form_key.currentState!.validate() && nameController.text.isNotEmpty) {
                  widget.groceriesList.insert(0, MIASelectOptionsModel(title: nameController.text, selected: false, subtitle: ''));
                }
                finish(context, widget.groceriesList);
              })
            ],
          ),
        ),
        ListView.separated(
          itemCount: list.length,
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                IconButton(
                  icon: Icon(Icons.add, color: miaSecondaryTextColor),
                  onPressed: () {
                    widget.groceriesList.insert(0, MIASelectOptionsModel(title: list[index].title, selected: false, subtitle: ''));
                    //finish(context,widget.groceriesList);
                  },
                ),
                Text(
                  list[index].title,
                  style: boldTextStyle(),
                ),
              ],
            );
          },
        ).expand()
      ]).paddingAll(16),
    );
  }
}
