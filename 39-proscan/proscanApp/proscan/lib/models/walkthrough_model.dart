class Walkthrough {
  String? image;
  String? titleText;
  String? bodyText;
  Walkthrough({this.image, this.titleText, this.bodyText});
}

List<Walkthrough> WalkthroughPages = [
  Walkthrough(
      image: "assets/images/walkthrough_screen_image_1.png",
      titleText: "Scan all your documents quickly and easily",
      bodyText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor..."),
  Walkthrough(
      image: "assets/images/walkthrough_screen_image_2.png",
      titleText: "You can also edit and customize scan results",
      bodyText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor..."),
  Walkthrough(
      image: "assets/images/walkthrough_screen_image_3.png",
      titleText: "Organize your documents with ProScan now!",
      bodyText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor..."),
];
