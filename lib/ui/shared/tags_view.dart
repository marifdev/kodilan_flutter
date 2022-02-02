import 'package:flutter/material.dart';
import 'package:kodilan_flutter/models/tags.dart';

class TagsView extends StatelessWidget {
  final List<Tags>? tags;
  const TagsView({Key? key, required this.tags}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        children: tags!.map((tag) {
          return Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(5),
            child: Text(tag.name!),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          );
        }).toList(),
      ),
    );
  }
}
