import 'package:flutter/material.dart';
import 'package:kodilan_flutter/models/tags.dart';

class TagsView extends StatelessWidget {
  final List<Tags>? tags;
  const TagsView({Key? key, required this.tags}) : super(key: key);

  // TODO: make tags clickable
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: tags!.map((tag) {
          return Container(
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
