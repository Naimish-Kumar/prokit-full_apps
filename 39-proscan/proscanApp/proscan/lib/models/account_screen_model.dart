class AccountScreenOptions {
  String? image;
  String? title;
  String? trailingText;

  AccountScreenOptions(this.image, this.title, this.trailingText);
}

List<AccountScreenOptions> accountOptions = [
  AccountScreenOptions("assets/icons/bottom_navigation_icons/user_outlined.png", "Personal Info", ""),
  AccountScreenOptions("assets/images/setting.png", "Preferences", ""),
  AccountScreenOptions("assets/images/security.png", "Security", ""),
  AccountScreenOptions("assets/images/document.png", "Language", "English (US)"),
  AccountScreenOptions("assets/images/view.png", "Dark Mode", ""),
];
List<AccountScreenOptions> aboutAppOptions = [
  AccountScreenOptions("assets/images/document.png", "Help Center", ""),
  AccountScreenOptions("assets/icons/info.png", "About ProScan", ""),
  AccountScreenOptions("assets/icons/exit.png", "Logout", ""),
];
