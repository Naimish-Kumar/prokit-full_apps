import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../components/invite_user_component.dart';
import '../../components/text_styles.dart';
import '../../main.dart';
import '../../models/invite_user_model.dart';

class InviteFriends extends StatefulWidget {
  const InviteFriends({super.key});

  @override
  State<InviteFriends> createState() => _InviteFriendsState();
}

class _InviteFriendsState extends State<InviteFriends> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          surfaceTintColor: appStore.isDarkMode ? scaffoldDarkColor : context.scaffoldBackgroundColor,
          iconTheme: IconThemeData(color: appStore.isDarkMode ? Colors.white : Colors.black),
          title: Text('Invite Friends', style: primarytextStyle(color: appStore.isDarkMode ? Colors.white : Colors.black)),
          backgroundColor: appStore.isDarkMode ? scaffoldDarkColor : context.scaffoldBackgroundColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.height,
              ...List.generate(
                getInviteUserModelList().length,
                (index) => InviteUserComponent(userModelData: getInviteUserModelList()[index], selectedText: 'Invited', unselectedText: 'Invite').paddingSymmetric(vertical: 2),
              ),
            ],
          ),
        ),
      );
    });
  }
}
