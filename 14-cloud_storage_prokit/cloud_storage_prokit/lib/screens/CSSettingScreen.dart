import 'package:cloudstorage_prokit/main.dart';
import 'package:cloudstorage_prokit/screens/CSCameraUploadScreen.dart';
import 'package:cloudstorage_prokit/screens/CSManageDevicesScreen.dart';
import 'package:cloudstorage_prokit/screens/CSPasscodeScreen.dart';
import 'package:cloudstorage_prokit/screens/CSStartingScreen.dart';
import 'package:cloudstorage_prokit/screens/CSUpgradeAccountScreen.dart';
import 'package:cloudstorage_prokit/screens/CSWalkthroughScreen2.dart';
import 'package:cloudstorage_prokit/utils/CSColors.dart';
import 'package:cloudstorage_prokit/utils/CSConstants.dart';
import 'package:cloudstorage_prokit/utils/CSWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:package_info/package_info.dart';

class CSSettingScreen extends StatefulWidget {
  static String tag = '/CSSettingScreen';

  @override
  CSSettingScreenState createState() => CSSettingScreenState();
}

class CSSettingScreenState extends State<CSSettingScreen> {
  bool offlineFiles = false;
  bool syncContacts = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    // LiveStream().on(cloud_lblDarkMode, (v) {
    //   setState(() {});
    // });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) => SafeArea(
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  pinned: true,
                  iconTheme: IconThemeData(color: appStore.isDarkModeOn ? white : black),
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      finish(context);
                      appStore.toggleDarkMode(value: true);
                      // LiveStream().emit(cloud_lblDarkMode);
                    },
                  ),
                  expandedHeight: 120,
                  flexibleSpace: FlexibleSpaceBar(title: Text("$CSAppName settings", style: boldTextStyle())),
                ),
              ];
            },
            body: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Your Account", style: boldTextStyle(size: 14)).paddingOnly(top: 10, left: 16),
                        buildDivider(),
                        ListTile(
                          onTap: () {
                            showBottomSheetForUpdatePhoto(context);
                          },
                          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                          title: Text("Personal", style: boldTextStyle()),
                          subtitle: Text("$CSAppName Basic"),
                          leading: CircleAvatar(
                            backgroundColor: CSDarkBlueColor,
                            child: Text("JD", style: boldTextStyle(size: 16, color: Colors.white)),
                          ),
                          trailing: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            child: Text("Upgrade", style: boldTextStyle(size: 14, color: Colors.white)),
                            color: CSDarkBlueColor,
                          ).onTap(
                            () {
                              CSUpgradeAccountScreen().launch(context);
                            },
                          ),
                        ),
                        buildDivider(),
                        ListTile(
                          title: Text("Edit photo", style: TextStyle(color: CSDarkBlueColor)),
                          onTap: () => showBottomSheetForUpdatePhoto(context),
                          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                        ),
                        buildDivider(isFull: true),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: CSDarkBlueColor,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Color(0x00ffffff), width: 1),
                                  ),
                                  child: Image.asset('images/ic_theme.png', height: 20, width: 20, color: white),
                                ),
                                16.width,
                                Text('DarkMode', style: boldTextStyle()),
                              ],
                            ).paddingOnly(left: 16),
                            Switch(
                              value: appStore.isDarkModeOn,
                              activeColor: appColorPrimary,
                              onChanged: (s) {
                                appStore.toggleDarkMode(value: s);
                              },
                            )
                          ],
                        ).onTap(() {
                          appStore.toggleDarkMode();
                        }),
                      ],
                    ).paddingOnly(top: 15),
                    buildDivider(isFull: true),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Details", style: boldTextStyle(size: 14)).paddingOnly(top: 10, left: 16),
                        buildDivider(),
                        buildListTileForSetting(title: "Email", subTitle: "skg1498@gmail.com"),
                        buildDivider(),
                        buildListTileForSetting(title: "Space used", subTitle: "0.1% of 2.0 GB"),
                        buildDivider(),
                        buildListTileForSetting(
                          title: "Manage devices",
                          subTitle: "1 of 3",
                          onTap: () {
                            CSManageDevicesScreen().launch(context);
                          },
                        ),
                      ],
                    ).paddingOnly(top: 15),
                    buildDivider(isFull: true),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Features", style: boldTextStyle(size: 14)).paddingOnly(top: 10, left: 16),
                        buildDivider(),
                        buildListTileForSetting(
                          title: "Camera uploads",
                          trailing: Text("Off", style: TextStyle(fontSize: 16, color: Colors.grey)),
                          onTap: () {
                            CSCameraUploadScreen().launch(context);
                          },
                        ),
                        buildDivider(),
                        buildListTileForSetting(
                          title: "Configure passcode",
                          trailing: Text("Off", style: TextStyle(fontSize: 16, color: Colors.grey)),
                          onTap: () {
                            CSPasscodeScreen().launch(context);
                          },
                        ),
                        buildDivider(),
                        buildListTileForSetting(
                          title: "Connect Computer",
                          color: CSDarkBlueColor,
                          onTap: () {
                            CSWalkthroughScreen2().launch(context);
                          },
                        ),
                        buildDivider(),
                        buildListTileForSetting(title: "Offline Files", subTitle: "Currently using 0 Bytes"),
                        buildDivider(),
                        buildListTileForSetting(
                          title: "Use data for offline files",
                          subTitle: "Offline files will only download when you're connected to Wi-Fi",
                          trailing: Switch(
                            value: offlineFiles,
                            onChanged: (val) async {
                              bool isOK = await (buildCommonDialog(
                                context,
                                title: "Update files on data plan?",
                                content: "Updating files using cellular data could incur data charges",
                              ));
                              offlineFiles = isOK ? true : false;
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ).paddingOnly(top: 15),
                    buildDivider(isFull: true),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Cloudbox", style: boldTextStyle(size: 14)).paddingOnly(top: 10, left: 16),
                        buildDivider(),
                        buildListTileForSetting(title: "Manage Notification"),
                        buildDivider(),
                        buildListTileForSetting(title: "Manage default apps"),
                        buildDivider(),
                        buildListTileForSetting(
                          title: "Sync contacts",
                          subTitle: "Then you can easily share with your contacts on Cloudbox",
                          trailing: Switch(
                            value: syncContacts,
                            onChanged: (val) {
                              setState(() {
                                syncContacts = val;
                              });
                            },
                          ),
                        ),
                        buildDivider(),
                        buildListTileForSetting(title: "Invite friends to get free space"),
                        buildDivider(),
                        buildListTileForSetting(title: "Get early releases"),
                        buildDivider(),
                        buildListTileForSetting(title: "Help"),
                        buildDivider(),
                        buildListTileForSetting(title: "Send feedback"),
                        buildDivider(),
                        buildListTileForSetting(title: "Terms of service"),
                        buildDivider(),
                        buildListTileForSetting(title: "Privacy policy"),
                        buildDivider(),
                        buildListTileForSetting(title: "Open source & third party software"),
                        buildDivider(),
                        FutureBuilder<PackageInfo>(
                          future: PackageInfo.fromPlatform(),
                          builder: (_, snap) {
                            if (snap.hasError) return Text(snap.error.toString()).center();
                            if (snap.hasData) {
                              return buildListTileForSetting(title: "App version", subTitle: snap.data!.version);
                            }
                            return CircularProgressIndicator();
                          },
                        ),
                      ],
                    ).paddingOnly(top: 15),
                    buildDivider(isFull: true),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Privacy", style: boldTextStyle(size: 14)).paddingOnly(top: 10, left: 16),
                        buildDivider(),
                        buildListTileForSetting(title: "Hide recent items on Home"),
                        buildDivider(),
                        buildListTileForSetting(
                          title: "Clear cache",
                          onTap: () {
                            toasty(context, "Cache cleared");
                          },
                        ),
                        buildDivider(),
                        buildListTileForSetting(
                          title: "Clear search history",
                          onTap: () {
                            toasty(context, "Recent search history cleared");
                          },
                        ),
                      ],
                    ).paddingOnly(top: 15),
                    buildDivider(isFull: true),
                    buildDivider(isFull: true).paddingTop(10),
                    buildListTileForSetting(
                      title: "Sign out of this Cloudbox",
                      color: Colors.red.shade800,
                      onTap: () async {
                        bool isSignOut = await (buildCommonDialog(
                          context,
                          posBtn: "Sign out",
                          content: "Are you sure you want to sign out from your $CSAppName account ?",
                        ));
                        if (isSignOut) {
                          finish(context);
                          CSStartingScreen().launch(context);
                        }
                        setState(() {});
                      },
                    ),
                    buildDivider(isFull: true),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}