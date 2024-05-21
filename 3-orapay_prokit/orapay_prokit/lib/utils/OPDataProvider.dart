import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:orapay_prokit/model/OPModel.dart';
import 'package:orapay_prokit/utils/Colors.dart';

List<OPPickVerifyModel> getCardListItems() {
  List<OPPickVerifyModel> cardList = [];
  cardList.add(OPPickVerifyModel(cardTitle: 'Video call', cardSubTitle: 'We will call you shortly', image: 'images/orapay/opvideocall.png', cardColor: Color(0xFFFF6E18)));
  cardList.add(OPPickVerifyModel(cardTitle: 'Outlets', cardSubTitle: 'You came to our outlates', image: 'images/orapay/opoutlets.png', cardColor: Color(0xFF343EDB)));
  cardList.add(OPPickVerifyModel(cardTitle: 'Agents', cardSubTitle: 'Our agents will come to you', image: 'images/orapay/opagent.png', cardColor: Color(0xFFFF6E18)));
  return cardList;
}

List<OPPickVerifyModel> getAllCardListItems() {
  List<OPPickVerifyModel> allCardList = [];
  allCardList.add(OPPickVerifyModel(cardTitle: 'Visa', cardSubTitle: 'John Doe', image: 'images/orapay/opchip.png', cardColor: opPrimaryColor, cardExpireDate: '12/20', cardNumber: '3456'));
  allCardList.add(OPPickVerifyModel(cardTitle: 'Visa', cardSubTitle: 'John Doe', image: 'images/orapay/opchip.png', cardColor: opOrangeColor, cardExpireDate: '12/20', cardNumber: '3456'));
  allCardList.add(OPPickVerifyModel(cardTitle: 'Visa', cardSubTitle: 'John Doe', image: 'images/orapay/opchip.png', cardColor: opPrimaryColor, cardExpireDate: '12/20', cardNumber: '3456'));
  allCardList.add(OPPickVerifyModel(cardTitle: 'Visa', cardSubTitle: 'John Doe', image: 'images/orapay/opchip.png', cardColor: opOrangeColor, cardExpireDate: '12/20', cardNumber: '3456'));
  allCardList.add(OPPickVerifyModel(cardTitle: 'Visa', cardSubTitle: 'John Doe', image: 'images/orapay/opchip.png', cardColor: opPrimaryColor, cardExpireDate: '12/20', cardNumber: '3456'));

  return allCardList;
}

List<OPPickVerifyModel> getTransactionListItems() {
  List<OPPickVerifyModel> transactionList = [];
  transactionList.add(OPPickVerifyModel(cardTitle: "John Deo", cardSubTitle: "Payment Received", cardNumber: "+ ₹250", cardColor: opPrimaryColor, icon: Icons.call_made));
  transactionList.add(OPPickVerifyModel(cardTitle: "John Deo", cardSubTitle: "Payment Received", cardNumber: "+ ₹250", cardColor: opPrimaryColor, icon: Icons.call_made));
  transactionList.add(OPPickVerifyModel(cardTitle: "John Deo", cardSubTitle: "Payment sent", cardNumber: "- ₹50", cardColor: Colors.red, icon: Icons.call_received));
  transactionList.add(OPPickVerifyModel(cardTitle: "John Deo", cardSubTitle: "Payment sent", cardNumber: "- ₹130", cardColor: Colors.red, icon: Icons.call_received));
  transactionList.add(OPPickVerifyModel(cardTitle: "John Deo", cardSubTitle: "Payment Received", cardNumber: "+ ₹250", cardColor: opPrimaryColor, icon: Icons.call_made));
  transactionList.add(OPPickVerifyModel(cardTitle: "John Deo", cardSubTitle: "Payment Received", cardNumber: "+ ₹250", cardColor: opPrimaryColor, icon: Icons.call_made));
  transactionList.add(OPPickVerifyModel(cardTitle: "John Deo", cardSubTitle: "Payment sent", cardNumber: "- ₹170", cardColor: Colors.red, icon: Icons.call_received));
  transactionList.add(OPPickVerifyModel(cardTitle: "John Deo", cardSubTitle: "Payment Received", cardNumber: "+ ₹250", cardColor: opPrimaryColor, icon: Icons.call_made));
  transactionList.add(OPPickVerifyModel(cardTitle: "John Deo", cardSubTitle: "Payment Received", cardNumber: "+ ₹250", cardColor: opPrimaryColor, icon: Icons.call_made));
  transactionList.add(OPPickVerifyModel(cardTitle: "John Deo", cardSubTitle: "Payment Received", cardNumber: "+ ₹250", cardColor: opPrimaryColor, icon: Icons.call_made));

  return transactionList;
}

List<OPPickVerifyModel> getSettingItems() {
  List<OPPickVerifyModel> settingList = [];
  settingList.add(OPPickVerifyModel(cardTitle: 'Information', icon: Icons.person));
  settingList.add(OPPickVerifyModel(cardTitle: 'Security', icon: Icons.security));
  settingList.add(OPPickVerifyModel(cardTitle: 'Contact us', icon: Icons.message));
  settingList.add(OPPickVerifyModel(cardTitle: 'Support', icon: Icons.help));
  settingList.add(OPPickVerifyModel(cardTitle: 'Logout', icon: Icons.access_time));

  return settingList;
}

List<LanguageDataModel> languageList() {
  return [
    LanguageDataModel(id: 1, name: 'English', languageCode: 'en', fullLanguageCode: 'en-US', flag: 'images/flag/ic_us.png'),
    LanguageDataModel(id: 2, name: 'Hindi', languageCode: 'hi', fullLanguageCode: 'hi-IN', flag: 'images/flag/ic_hi.png'),
    LanguageDataModel(id: 3, name: 'Arabic', languageCode: 'ar', fullLanguageCode: 'ar-AR', flag: 'images/flag/ic_ar.png'),
    LanguageDataModel(id: 4, name: 'French', languageCode: 'fr', fullLanguageCode: 'fr-FR', flag: 'images/flag/ic_fr.png'),
  ];
}
