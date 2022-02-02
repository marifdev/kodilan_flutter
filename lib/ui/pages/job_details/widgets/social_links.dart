import 'package:flutter/material.dart';
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
            style: ElevatedButton.styleFrom(
              primary: Colors.black54,
            ),
            onPressed: () {},
            child: Icon(Icons.public),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black54,
            ),
            onPressed: () {},
            child: Icon(Icons.public), //TODO: add twitter icon
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black54,
            ),
            onPressed: () {},
            child: Icon(Icons.public), //TODO: add linkedin icon
          ),
        ),
      ]),
    );
  }
}
