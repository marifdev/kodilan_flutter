import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kodilan_flutter/models/post.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialLinks extends StatelessWidget {
  final Post post;
  const SocialLinks({Key? key, required this.post}) : super(key: key);

  void socialButtonOnPress(String? url, String platform) {
    platform == 'twitter' ? (url = 'https://twitter.com/$url') : null;
    _launchURL(url);
  }

  void _launchURL(_url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(children: [
        if (post.company?.www != null)
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.black45),
              onPressed: () {
                socialButtonOnPress(post.company?.www, 'www');
              },
              child: const Icon(Icons.public),
            ),
          ),
        if (post.company?.twitter != null)
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
              onPressed: () {
                socialButtonOnPress(post.company?.twitter, 'twitter');
              },
              child: const FaIcon(FontAwesomeIcons.twitter),
            ),
          ),
        if (post.company?.linkedin != null)
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 3, 112, 173),
              ),
              onPressed: () {
                socialButtonOnPress(post.company?.linkedin, 'linkedin');
              },
              child: const FaIcon(FontAwesomeIcons.linkedin),
            ),
          ),
      ]),
    );
  }
}
