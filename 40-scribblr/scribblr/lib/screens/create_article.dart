import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:scribblr/components/text_styles.dart';
import 'package:scribblr/utils/colors.dart';
import 'package:scribblr/utils/common.dart';

import '../main.dart';

class CreateArticleScreen extends StatefulWidget {
  const CreateArticleScreen({super.key});

  @override
  State<CreateArticleScreen> createState() => _CreateArticleScreenState();
}

class _CreateArticleScreenState extends State<CreateArticleScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  String? topicValue;
  String? SelectValue;

  List<String> selectItem = ['Yes', 'No'];
  List<String> topicItem = [
    'Business',
    'Education',
    'Music',
    'Nature',
    'Productivity',
    'Sports',
    'Travel',
  ];

  Future getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildImageStack(),
          15.height,
          Text('Title',
              style: primarytextStyle(color: appStore.isDarkMode ? Colors.white : Colors.black)),
          15.height,
          buildTitleTextField(),
          15.height,
          Text('Article',
              style: TextStyle(color: appStore.isDarkMode ? Colors.white : Colors.black)),
          15.height,
          buildArticleTextField(),
          15.height,
          Text('Select Topic',
              style: primarytextStyle(color: appStore.isDarkMode ? Colors.white : Colors.black)),
          15.height,
          buildTopicDropdown(),
          15.height,
          Text(
            'Allow Comments from Community',
            style: primarytextStyle(color: appStore.isDarkMode ? Colors.white : Colors.black),
          ),
          15.height,
          buildCommentDropdown(),
          15.height,
        ],
      ),
    );
  }

  Stack buildImageStack() {
    return Stack(
      children: <Widget>[
        Container(
          width: 400,
          height: 400,
          decoration: BoxDecoration(
            image: _image == null
                ? null
                : DecorationImage(image: FileImage(File(_image!.path)), fit: BoxFit.cover),
            color: appStore.isDarkMode ? Color(0xFF1F222A) : borderColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: _image == null
              ? GestureDetector(
                  onTap: getImage,
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Icon(Icons.image, color: textSecondaryColor),
                    Text('Add article cover image', style: secondarytextStyle())
                  ]),
                )
              : null,
        ),
        if (_image != null)
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(color: primaryColor, shape: BoxShape.circle),
              child: GestureDetector(
                onTap: getImage,
                child: IconButton(
                  icon: Icon(Icons.edit, size: 15, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      _image = null;
                    });
                  },
                ),
              ),
            ),
          ),
      ],
    );
  }

  TextField buildTitleTextField() {
    return TextField(
      style: TextStyle(color: appStore.isDarkMode ? Colors.white : Colors.black),
      maxLines: 2,
      minLines: 1,
      decoration: InputDecoration(
        hintText: 'Article Title',
        hintStyle: secondarytextStyle(),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        filled: true,
        fillColor: appStore.isDarkMode ? Color(0xFF1F222A) : borderColor,
      ),
      keyboardType: TextInputType.multiline,
      textAlign: TextAlign.justify,
      textInputAction: TextInputAction.newline,
    );
  }

  TextField buildArticleTextField() {
    return TextField(
      style: TextStyle(color: appStore.isDarkMode ? Colors.white : Colors.black),
      maxLines: 20,
      minLines: 5,
      decoration: InputDecoration(
        hintText: 'Write your article here...',
        hintStyle: secondarytextStyle(),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        filled: true,
        fillColor: appStore.isDarkMode ? Color(0xFF1F222A) : borderColor,
      ),
      keyboardType: TextInputType.multiline,
      textAlign: TextAlign.justify,
      textInputAction: TextInputAction.newline,
    );
  }

  DropdownButtonFormField buildTopicDropdown() {
    return DropdownButtonFormField(
      dropdownColor: appStore.isDarkMode ? scaffoldDarkColor : Colors.white,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Topic is Required';
        }
        return null;
      },
      hint: Text(
        'Select Topic',
        style: TextStyle(color: appStore.isDarkMode ? scaffoldLightColor : scaffoldDarkColor),
      ),
      value: topicValue?.toLowerCase(),
      decoration: inputDecoration(context),
      items: topicItem.map((itemValue) {
        return DropdownMenuItem(
            child: Text(
              itemValue,
              style: TextStyle(color: appStore.isDarkMode ? scaffoldLightColor : scaffoldDarkColor),
            ),
            value: itemValue.toLowerCase());
      }).toList(),
      onChanged: (value) {
        topicValue = value!;
        print('Topic: $topicValue');
        setState(() {});
      },
    );
  }

  DropdownButtonFormField buildCommentDropdown() {
    return DropdownButtonFormField(
      dropdownColor: appStore.isDarkMode ? scaffoldDarkColor : Colors.white,
      hint: Text(
        'Select',
        style: TextStyle(color: appStore.isDarkMode ? scaffoldLightColor : scaffoldDarkColor),
      ),
      value: SelectValue?.toLowerCase(),
      decoration: inputDecoration(context),
      items: selectItem.map((itemValue) {
        return DropdownMenuItem(
            child: Text(
              itemValue,
              style: TextStyle(color: appStore.isDarkMode ? scaffoldLightColor : scaffoldDarkColor),
            ),
            value: itemValue.toLowerCase());
      }).toList(),
      onChanged: (value) {
        SelectValue = value!;
        print('Select: $SelectValue');
        setState(() {});
      },
    );
  }
}
