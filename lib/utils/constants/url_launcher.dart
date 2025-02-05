import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

launchUrlLink(String url) async {
  await launchUrl(Uri.parse(url));
}

emailUrlLunch(
    {required String email, required String msg, required String name}) async {
  var url = Uri(
      scheme: 'mailto',
      // path: "pranavofficial37@gmail.com",
      queryParameters: {
        'body': msg,
        'subject': name,
        'cc': email,
      });

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    log('url cannot be launch');
  }
}
