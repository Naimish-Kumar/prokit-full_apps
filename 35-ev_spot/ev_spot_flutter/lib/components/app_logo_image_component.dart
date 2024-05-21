import 'package:ev_spot_flutter/utils/common.dart';
import 'package:ev_spot_flutter/utils/images.dart';
import 'package:flutter/material.dart';

class AppLogoImageComponent extends StatelessWidget {
  AppLogoImageComponent({Key? key, this.isCenter}) : super(key: key);

  final bool? isCenter;

  @override
  Widget build(BuildContext context) {
    if (isCenter ?? false) {
      return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('EV', style: boldTextStyle(fontSize: 24)),
            Image.asset(ic_thunder, height: 24, width: 24, color: Theme.of(context).colorScheme.primary),
            Text('SPOT', style: boldTextStyle(fontSize: 24)),
          ],
        ),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('EV', style: boldTextStyle(fontSize: 24)),
          Image.asset(ic_thunder, height: 24, width: 24, color: Theme.of(context).colorScheme.primary),
          Text('SPOT', style: boldTextStyle(fontSize: 24)),
        ],
      );
    }
  }
}
