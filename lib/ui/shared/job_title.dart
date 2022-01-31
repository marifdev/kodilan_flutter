import 'package:flutter/material.dart';

class JobTitleWidget extends StatelessWidget {
  final String position;

  const JobTitleWidget(this.position, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      position,
      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
    );
  }
}
