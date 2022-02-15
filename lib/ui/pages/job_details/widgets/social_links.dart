import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kodilan_flutter/models/post.dart';

class SocialLinks extends StatelessWidget {
  final Post post;
  const SocialLinks({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.black45),
            onPressed: () {},
            child: const Icon(Icons.public),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
            onPressed: () {},
            child: const FaIcon(FontAwesomeIcons.twitter),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color.fromARGB(255, 3, 112, 173),
            ),
            onPressed: () {},
            child: const FaIcon(FontAwesomeIcons.linkedin),
          ),
        ),
      ]),
    );
  }
}
