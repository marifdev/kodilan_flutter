import 'package:flutter/material.dart';
import 'package:kodilan_flutter/ui/pages/search_result/search_result_view.dart';

import '../../models/tags.dart';

class Tag extends StatelessWidget {
  final Tags tag;
  const Tag({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchResult(
              tag: tag,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Text(tag.name!),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}
