import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:scribblr/utils/colors.dart';

import '../main.dart';

class CustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Divider(
        height: 50,
        thickness: appStore.isDarkMode ? 0.3 : 0.2,
        indent: 10,
        endIndent: 10,
        color: dividerDarkColor,
      ),
    );
  }
}
