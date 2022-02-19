import 'package:flutter/material.dart';
import 'package:kodilan_flutter/models/tags.dart';
import 'package:kodilan_flutter/ui/shared/tag.dart';

class TagsView extends StatelessWidget {
  final List<Tags>? tags;
  const TagsView({Key? key, required this.tags}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: tags!.map((tag) {
        return Tag(tag: tag);
      }).toList(),
    );
  }
}
