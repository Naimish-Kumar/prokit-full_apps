import 'package:cloudstorage_prokit/components/CSDrawerComponents.dart';
import 'package:cloudstorage_prokit/components/CSSearchBar.dart';
import 'package:cloudstorage_prokit/main.dart';
import 'package:cloudstorage_prokit/screens/CSRecentScreen.dart';
import 'package:cloudstorage_prokit/screens/CSSharedScreen.dart';
import 'package:cloudstorage_prokit/screens/CSStarredScreen.dart';
import 'package:cloudstorage_prokit/utils/CSColors.dart';
import 'package:cloudstorage_prokit/utils/CSConstants.dart';
import 'package:cloudstorage_prokit/utils/CSWidgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CSDashboardScreen extends StatefulWidget {
  static String tag = '/CSDashboardScreen';

  @override
  CSDashboardScreenState createState() => CSDashboardScreenState();
}

class CSDashboardScreenState extends State<CSDashboardScreen> {
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
    return Scaffold(
      drawer: CSDrawerComponents(),
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          floatHeaderSlivers: true,
          physics: NeverScrollableScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                iconTheme: IconThemeData(color: appStore.isDarkModeOn ? white : black),
                actions: [
                  IconButton(
                    icon: Icon(Icons.search, color: appStore.isDarkModeOn ? white : black),
                    onPressed: () {
                      showSearch(
                        context: context,
                        delegate: CSSearchBar(hintText: "Searching in $CSAppName", listData: getCloudboxList),
                      );
                    },
                  )
                ],
                expandedHeight: 120,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  title: Text("Home", style: boldTextStyle(size: 20)),
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: appStore.isDarkModeOn ? white : Colors.black,
                    unselectedLabelColor: Colors.grey,
                    labelStyle: primaryTextStyle(size: 18),
                    isScrollable: true,
                    tabs: [
                      Tab(text: "Recent"),
                      Tab(text: "Shared"),
                      Tab(text: "Starred"),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              CSRecentScreen(),
              CSSharedScreen(),
              CSStarredScreen(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showBottomSheetForAddingData(context);
          setState(() {});
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: CSDarkBlueColor,
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        color: context.cardColor,
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      width: double.infinity,
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
