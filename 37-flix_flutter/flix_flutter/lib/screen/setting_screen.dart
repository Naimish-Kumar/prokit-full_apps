import 'package:flutter/material.dart';
import 'package:prokit_flutter/utils/common_widgets.dart';

class SettingScreen extends StatefulWidget {
  State<SettingScreen> createState() => SettingScreenState();
}

class SettingScreenState extends State<SettingScreen> {
  List<String> title = ['General', 'Cache', 'Other'];
  List<String> generalSettings = ['Change Languages', 'Stream Quality', 'Notification', 'Autoplay Videos'];

  bool mode = true;
  bool notifications = true;
  bool autoplay = false;
  bool enableCache = true;
  List<IconData> generalSettingsIconList = [
    Icons.translate_rounded,
    Icons.wifi,
    Icons.notifications,
    Icons.notifications
  ];
  List<String> cacheList = ['Enable cache', 'Clear cache'];
  List<IconData> leadingcatchIconList = [Icons.square_rounded, Icons.cleaning_services_rounded];
  List<String> otherSetings = ['Privacy Policy', 'Security Notifications'];
  List<IconData> otherSetingsLeadingIcon = [
    Icons.privacy_tip,
    Icons.notifications,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: backButton(),
        ),
        title: Text(
          'Settings',
          style: boldTextStyle(fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Wrap(
          direction: Axis.vertical,
          spacing: 32,
          children: [
            Wrap(
              spacing: 16,
              direction: Axis.vertical,
              children: [
                Text(
                  title[0],
                  style: boldTextStyle(fontSize: 20),
                ),
                Wrap(
                  spacing: 16,
                  direction: Axis.vertical,
                  children: List.generate(generalSettings.length, (index) {
                    return generalSettingsComponent(index);
                  }),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title[1],
                  style: boldTextStyle(fontSize: 20),
                ),
                SizedBox(height: 14),
                Container(
                  height: 6,
                  width: MediaQuery.of(context).size.width - 32,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Colors.grey.shade800),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'Used  2.4GB',
                      style: secondaryTextStyle(color: Colors.white60, fontSize: 12),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 2 + 36),
                    Text('Free 6.0GB', style: secondaryTextStyle(color: Colors.white60, fontSize: 12)),
                  ],
                ),
                SizedBox(height: 12),
                Wrap(
                  spacing: 16,
                  direction: Axis.vertical,
                  children: List.generate(cacheList.length, (index) {
                    return cacheSettings(index);
                  }),
                )
              ],
            ),
            Wrap(
              spacing: 14,
              direction: Axis.vertical,
              children: [
                Text(
                  title[2],
                  style: boldTextStyle(fontSize: 20),
                ),
                Wrap(
                  spacing: 16,
                  direction: Axis.vertical,
                  children: List.generate(otherSetings.length, (index) {
                    return otherSettings(index);
                  }),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  generalSettingsComponent(int index) {
    List trailingIcons = [
      TextButton(
        onPressed: () {},
        child: Text(
          'English',
          style: secondaryTextStyle(color: Colors.white60),
        ),
      ),
      TextButton(
        onPressed: () {},
        child: Text(
          'Full HD',
          style: secondaryTextStyle(color: Colors.white60),
        ),
      ),
      Switch.adaptive(
          value: notifications,
          activeTrackColor: Colors.red,
          activeColor: Colors.white,
          onChanged: (newValue) {
            notifications = !notifications;
            setState(() {});
          }),
      Switch.adaptive(
          value: autoplay,
          activeColor: Colors.white,
          activeTrackColor: Colors.red,
          onChanged: (newValue) {
            autoplay = !autoplay;
            setState(() {});
          })
    ];
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width - 32,
        padding: EdgeInsets.only(left: 16, right: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(generalSettingsIconList[index], size: 26),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                generalSettings[index],
                style: primaryTextStyle(),
              ),
            ),
            Container(
              height: 40,
              width: 70,
              child: trailingIcons[index],
            )
          ],
        ),
      ),
    );
  }

  cacheSettings(int index) {
    return Container(
        height: 60,
        width: MediaQuery.of(context).size.width - 32,
        padding: EdgeInsets.only(left: 16, right: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              leadingcatchIconList[index],
              size: 26,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                cacheList[index],
                style: primaryTextStyle(),
              ),
            ),
            index == 0
                ? Switch(
                    value: enableCache,
                    activeTrackColor: Colors.red,
                    activeColor: Colors.white,
                    onChanged: (newvalue) {
                      enableCache = !enableCache;
                      setState(() {});
                    })
                : Offstage(),
          ],
        ));
  }

  themeComponent() {
    return Wrap(
      children: [
        GestureDetector(
          onTap: () {
            mode = !mode;
            setState(() {});
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 2 - 32,
            height: 40,
            alignment: Alignment.center,
            decoration:
                BoxDecoration(color: mode ? Colors.red : Colors.grey.shade800, borderRadius: BorderRadius.circular(4)),
            child: Text(
              'Dark Mode',
              style: boldTextStyle(
                color: mode ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            mode = !mode;
            setState(() {});
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: mode ? Colors.grey.shade800 : Colors.white70,
                borderRadius: BorderRadius.only(topRight: Radius.circular(4), bottomRight: Radius.circular(8))),
            child: Text(
              'Light mode',
              style: boldTextStyle(color: mode ? Colors.white : Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  otherSettings(int index) {
    return Container(
        height: 60,
        width: MediaQuery.of(context).size.width - 32,
        padding: EdgeInsets.only(
          left: 16,
        ),
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              otherSetingsLeadingIcon[index],
              size: 26,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                otherSetings[index],
                style: primaryTextStyle(),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white60,
                  size: 16,
                ))
          ],
        ));
  }
}
