class ContactUs {
  String? image;
  String? title;

  ContactUs({this.image, this.title});
}

List<ContactUs> contactUsList = [
  ContactUs(title: "Contact us", image: "assets/icons/contact_us_screen_icons/support.png"),
  ContactUs(title: "WhatsApp", image: "assets/icons/contact_us_screen_icons/whatsapp.png"),
  ContactUs(title: "Facebook", image: "assets/icons/contact_us_screen_icons/facebook.png"),
  ContactUs(title: "Twitter", image: "assets/icons/contact_us_screen_icons/twitter.png"),
  ContactUs(title: "Instagram", image: "assets/icons/contact_us_screen_icons/instagram.png"),
  ContactUs(title: "website", image: "assets/icons/contact_us_screen_icons/web.png"),
];
