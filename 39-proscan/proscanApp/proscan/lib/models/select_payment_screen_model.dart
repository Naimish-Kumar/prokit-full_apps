class paymentScreenOptions {
  String? title;
  String? image;

  paymentScreenOptions(this.title, this.image);
}

List<paymentScreenOptions> paymentOptions = [
  paymentScreenOptions("PayPal", "assets/images/payment_screen_images/paypal.png"),
  paymentScreenOptions("Google Pay", "assets/images/payment_screen_images/google.png"),
  paymentScreenOptions("Apple Pay", "assets/images/sign_in_screen_images/apple.png"),
  paymentScreenOptions(".... .... .... 5567", "assets/images/payment_screen_images/am_ex.png"),
  paymentScreenOptions(".... .... .... 7677", "assets/images/payment_screen_images/visa.png"),
];
