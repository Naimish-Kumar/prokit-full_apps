import 'package:flutter/material.dart';
import 'package:juber_car_booking/main.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:juber_car_booking/screens/JCBFavouriteScreen.dart';
import 'package:juber_car_booking/screens/JCBMyRidesScreen.dart';
import 'package:juber_car_booking/screens/JCBPaymentMethodScreen.dart';
import 'package:juber_car_booking/screens/JCBProfileScreen.dart';
import 'package:juber_car_booking/screens/JCBPromotionsScreen.dart';
import 'package:juber_car_booking/utils/JBCColors.dart';

class JCBDrawerComponent extends StatefulWidget {
  const JCBDrawerComponent({Key? key}) : super(key: key);

  @override
  State<JCBDrawerComponent> createState() => _JCBDrawerComponentState();
}

class _JCBDrawerComponentState extends State<JCBDrawerComponent> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: jcbPrimaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Image.asset(
                    'images/juberCarBooking/jcb_face2.jpg',
                    height: 58,
                    width: 58,
                    fit: BoxFit.cover,
                  ).cornerRadiusWithClipRRect(100),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: radius(100),
                  ),
                ),
                16.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Shane Mendoza', style: boldTextStyle(color: Colors.white, size: 18)),
                        Text('470-499-4935', style: secondaryTextStyle(color: jcbSecBorderColor)),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
                      onPressed: () {
                        finish(context);
                        JCBProfileScreen().launch(context);
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            minLeadingWidth: 0,
            title: Text("My rides", style: boldTextStyle()),
            leading: Icon(Icons.access_time_rounded, color: jcbGreyColor),
            onTap: () {
              finish(context);
              JCBMyRidesScreen().launch(context);
            },
          ),
          ListTile(
            minLeadingWidth: 0,
            title: Text("Promotion", style: boldTextStyle()),
            leading: Image.asset(
              'images/juberCarBooking/jcbIcons/ic_promotions.png',
              color: jcbGreyColor,
              height: 22,
              width: 22,
              fit: BoxFit.cover,
            ),
            onTap: () {
              finish(context);
              JCBPromotionsScreen().launch(context);
            },
          ),
          ListTile(
            minLeadingWidth: 0,
            title: Text("My favourites", style: boldTextStyle()),
            leading: Icon(Icons.star_border, color: jcbGreyColor),
            onTap: () {
              finish(context);
              JCBFavouriteScreen().launch(context);
            },
          ),
          ListTile(
            minLeadingWidth: 0,
            title: Text("My payment", style: boldTextStyle()),
            leading: Icon(Icons.payment, color: jcbGreyColor),
            onTap: () {
              finish(context);
              JCBPaymentMethodScreen().launch(context);
            },
          ),
          ListTile(
            minLeadingWidth: 0,
            title: Text("Notification", style: boldTextStyle()),
            leading: Icon(Icons.notifications_none_outlined, color: jcbGreyColor),
            onTap: () {},
          ),
          ListTile(
            minLeadingWidth: 0,
            title: Text("Support", style: boldTextStyle()),
            leading: Image.asset(
              'images/juberCarBooking/jcbIcons/ic_messenger.png',
              color: jcbGreyColor,
              height: 20,
              width: 20,
              fit: BoxFit.cover,
            ),
            onTap: () {},
          ),
          ListTile(
            minLeadingWidth: 0,
            title: Text("Dark Mode", style: boldTextStyle()),
            leading: Image.asset(
              'images/juberCarBooking/jcbIcons/ic_theme.png',
              color: jcbGreyColor,
              height: 20,
              width: 20,
              fit: BoxFit.cover,
            ),
            trailing: Switch(
              value: appStore.isDarkModeOn,
              onChanged: (bool value) {
                appStore.toggleDarkMode(value: value);
                setState(() {});
              },
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
