import 'package:ev_spot_flutter/components/dotted_line.dart';
import 'package:ev_spot_flutter/main.dart';
import 'package:ev_spot_flutter/screens/privacy_policy_screen.dart';
import 'package:ev_spot_flutter/screens/sign_in_screen.dart';
import 'package:ev_spot_flutter/screens/terms_condition_screen.dart';
import 'package:ev_spot_flutter/utils/colors.dart';
import 'package:ev_spot_flutter/utils/common.dart';
import 'package:ev_spot_flutter/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _Setting_screenState();
}

class _Setting_screenState extends State<SettingScreen> {
  String languageGroupValue = 'English';
  String appModeGroupValue = 'Light Mode';
  String distanceGroupValue = 'Km (Kilometer)';

  List<String> languageListItem = ['English', 'Hindi', 'Arabic', 'Francais', 'Italian', 'Gujarati', 'Portugues', 'Turk'];
  List<String> appModeListItem = ['Light Mode', 'Dark Mode'];
  List<String> distanceListItem = ['Km (Kilometer)', 'Miles', 'Mm (Milimeters)', 'Cm (Centimeters)', 'M (Meters)'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Settings', style: boldTextStyle(fontSize: 22)),
                  SizedBox(height: 6),
                  Text('Set your preferences', style: secondaryTextStyle(fontSize: 16)),
                  SizedBox(height: 40),
                  GestureDetector(
                    onTap: () async {
                      languageGroupValue = await showDialog(
                        context: context,
                        builder: (context) => dialog(context: context, titleDialog: 'Select Language', listItemValue: languageListItem, groupValue: languageGroupValue),
                      );
                      setState(() {});
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Select Language', style: secondaryTextStyle(fontSize: 16)),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: Text('$languageGroupValue', style: primaryTextStyle())),
                            Icon(Icons.keyboard_arrow_down),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Observer(
                    builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          appModeGroupValue = appStore.isDarkMode ? "Dark Mode" : "Light Mode";
                          showDialog(
                            context: context,
                            builder: (context) => dialog(context: context, titleDialog: 'App Mode', listItemValue: appModeListItem, groupValue: appModeGroupValue),
                          ).then((value) {
                            if (value != null && value == 'Dark Mode') {
                              appStore.changeTheme(true, isInitiliaze: true);
                            } else {
                              appStore.changeTheme(false, isInitiliaze: true);
                            }
                          }).catchError((e) {
                            //
                          });
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text('App Mode', style: secondaryTextStyle(fontSize: 16)),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: Text('${appStore.isDarkMode ? 'Dark Mode' : 'Light Mode'}', style: primaryTextStyle())),
                                Icon(Icons.keyboard_arrow_down),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () async {
                      distanceGroupValue = await showDialog(
                        context: context,
                        builder: (context) => dialog(context: context, titleDialog: 'Distance Unity', listItemValue: distanceListItem, groupValue: distanceGroupValue),
                      );
                      setState(() {});
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Distance Unity', style: secondaryTextStyle(fontSize: 16)),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: Text('$distanceGroupValue', style: primaryTextStyle())),
                            Icon(Icons.keyboard_arrow_down),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            DottedLine(lineThickness: 2, dashLength: 4, dashColor: appStore.isDarkMode ? dividerBlackColor : dividerColor),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    child: Align(alignment: Alignment.centerLeft, child: Text('Terms & Conditions', style: primaryTextStyle())),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TermsAndConditionScreen()));
                    },
                  ),
                  TextButton(
                    child: Align(alignment: Alignment.centerLeft, child: Text('Privacy Policy', style: primaryTextStyle())),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()));
                    },
                  ),
                  TextButton(
                    child: Align(alignment: Alignment.centerLeft, child: Text('Logout', style: primaryTextStyle())),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Logout'),
                            content: Text('Do you really want to logout the account ?'),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            actions: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 50,
                                      child: OutlinedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('CANCEL', style: primaryTextStyle(color: Theme.of(context).colorScheme.primary)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Container(
                                      height: 50,
                                      child: TextButton(
                                        onPressed: () {
                                          /// It is used, when user wants to navigate page before all page removes from stack
                                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SignIn()), (route) => false);
                                        },
                                        child: Text('LOGOUT', style: primaryTextStyle(color: Colors.white)),
                                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dialog({required BuildContext context, String? titleDialog, required List<String> listItemValue, required String groupValue}) {
    return StatefulBuilder(
      builder: (ctx, setState) => SimpleDialog(
        title: Text('${titleDialog}'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: EdgeInsets.all(0),
        titlePadding: EdgeInsets.all(16),
        children: [
          Container(
            constraints: BoxConstraints(maxHeight: 200, minHeight: 100),
            width: 200,
            child: ListView.builder(
              itemCount: listItemValue.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return RadioListTile<String>(
                  value: listItemValue[index],
                  groupValue: groupValue,
                  title: Text(
                    listItemValue[index].toString(),
                    style: primaryTextStyle(color: appStore.isDarkMode ? Colors.white : textPrimaryLightColor),
                  ),
                  activeColor: Theme.of(context).colorScheme.primary,
                  visualDensity: VisualDensity.compact,
                  onChanged: (String? value) {
                    setState(() {
                      groupValue = value!;
                    });
                  },
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(DEFAULT_RADIUS))),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('DISMISS', style: primaryTextStyle(color: Theme.of(context).colorScheme.primary)),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(DEFAULT_RADIUS)))),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1),
              Expanded(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.only(bottomRight: Radius.circular(DEFAULT_RADIUS))),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context, groupValue);
                    },
                    child: Text('OKAY', style: primaryTextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
