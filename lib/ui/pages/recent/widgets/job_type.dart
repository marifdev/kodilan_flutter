import 'package:flutter/material.dart';

class JobTypeWidget extends StatelessWidget {
  final int jobType;

  const JobTypeWidget(this.jobType, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 0.0,
      ),
      child: buildJobTypeContainer(jobType),
    );
  }

  Container buildJobTypeContainer(int jobType) {
    Container container;
    switch (jobType) {
      case 1:
        container = Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            border: Border.all(
              color: Colors.blueAccent,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: const Text(
            'Tam Zamanlı',
            style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12),
          ),
        );
        break;
      case 2:
        container = Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 254, 246, 240),
            border: Border.all(
              color: const Color.fromARGB(255, 241, 99, 13),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: const Text(
            'Yarı Zamanlı',
            style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12),
          ),
        );
        break;
      case 3:
        container = Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 253, 252, 242),
            border: Border.all(
              color: const Color.fromARGB(255, 220, 170, 12),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: const Text(
            'Stajyer',
            style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12),
          ),
        );
        break;
      default:
        container = Container();
    }
    return container;
  }
}
