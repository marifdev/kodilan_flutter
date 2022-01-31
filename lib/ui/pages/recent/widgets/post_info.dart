import 'package:flutter/material.dart';

class PostInfoWidget extends StatelessWidget {
  final String companyName;
  final String location;
  final String updatedAt;

  const PostInfoWidget(this.companyName, this.location, this.updatedAt, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 0.0,
      ),
      child: Wrap(
        spacing: 8.0, // gap between adjacent chips
        runSpacing: 4.0, // gap between lines
        direction: Axis.horizontal,
        children: <Widget>[
          Wrap(
            children: <Widget>[
              const Icon(
                Icons.business_center,
                size: 15,
              ),
              Text(
                companyName,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Wrap(
            children: <Widget>[
              const Icon(
                Icons.location_on,
                size: 15,
              ),
              Text(
                location,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Wrap(
            children: <Widget>[
              const Icon(
                Icons.timer,
                size: 15,
              ),
              Text(
                updatedAt,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
