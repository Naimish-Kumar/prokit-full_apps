import 'package:ev_spot_flutter/main.dart';
import 'package:ev_spot_flutter/utils/common.dart';
import 'package:ev_spot_flutter/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String dropDownValue = "Tesla Model X";

  List<String> listItem = ['Tesla Model X', 'Porche Taycan', 'MG ZS EV', 'Mini Cooper SE', 'Tata Nexon EV', 'BMW i4'];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: appStore.isDarkMode ? Colors.black : Colors.white,
        statusBarIconBrightness: appStore.isDarkMode ? Brightness.light : Brightness.dark,
      ),
      child: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            body: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(Icons.arrow_back),
                            alignment: Alignment.topLeft,
                          ),
                          SizedBox(height: 10),
                          Text('Profile', style: boldTextStyle(fontSize: 22)),
                        ],
                      ),
                      Align(
                        heightFactor: 1.2,
                        widthFactor: 1.2,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              child: Image.asset(person_image, height: 80, width: 80, fit: BoxFit.cover),
                            ),
                            Positioned(
                              bottom: -10,
                              right: -10,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary, shape: BoxShape.circle),
                                child: Icon(Icons.camera_alt_rounded, color: Colors.white, size: 24),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Text('Full Name', style: primaryTextStyle()),
                  SizedBox(height: 10),
                  TextField(
                    decoration: inputDecoration(context, hintText: 'Enter Full Name'),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    cursorColor: Theme.of(context).colorScheme.primary,
                    cursorWidth: 1,
                  ),
                  SizedBox(height: 20),
                  Text('Phone Number', style: primaryTextStyle()),
                  SizedBox(height: 10),
                  TextField(
                    decoration: inputDecoration(context, hintText: 'Enter Phone Number'),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    cursorColor: Theme.of(context).colorScheme.primary,
                    cursorWidth: 1,
                  ),
                  SizedBox(height: 20),
                  Text('Email Address', style: primaryTextStyle()),
                  SizedBox(height: 10),
                  TextField(
                    decoration: inputDecoration(context, hintText: 'Enter Email Address'),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    cursorColor: Theme.of(context).colorScheme.primary,
                    cursorWidth: 1,
                  ),
                  SizedBox(height: 20),
                  Text('Your EV Car', style: primaryTextStyle()),
                  SizedBox(height: 10),
                  Container(
                    height: 60,
                    child: DropdownButtonFormField(
                      value: dropDownValue,
                      isExpanded: true,
                      decoration: inputDecoration(context),
                      icon: Icon(Icons.keyboard_arrow_down),
                      onChanged: (String? value) {
                        setState(() {
                          dropDownValue = value!;
                          print(dropDownValue);
                        });
                      },
                      items: listItem.map((valueItem) {
                        return DropdownMenuItem(child: Text(valueItem), value: valueItem);
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Fluttertoast.showToast(
                          msg: 'Profile updated successfully',
                          gravity: ToastGravity.BOTTOM,
                          toastLength: Toast.LENGTH_SHORT,
                          fontSize: 16,
                          backgroundColor: appStore.isDarkMode ? Theme.of(context).colorScheme.surfaceVariant : Colors.black,
                        );
                      },
                      child: Text('Update', style: primaryTextStyle(color: Colors.white)),
                      style: Theme.of(context).elevatedButtonTheme.style,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
