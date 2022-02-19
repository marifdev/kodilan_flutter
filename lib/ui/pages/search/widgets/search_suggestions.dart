import 'package:flutter/material.dart';
import 'package:kodilan_flutter/ui/shared/tags_view.dart';

import '../../../../models/tags.dart';

class SearchSuggestions extends StatelessWidget {
  final List<Tags> tags = [
    Tags(name: 'Frontend'),
    Tags(name: 'Backend'),
    Tags(name: 'Mobile'),
    Tags(name: 'DevOps'),
    Tags(name: 'Istanbul'),
    Tags(name: 'Izmir'),
    Tags(name: 'Ankara'),
    Tags(name: 'Remote'),
    Tags(name: 'Tam Zamanli'),
    Tags(name: 'Yari zamanli'),
    Tags(name: 'Stajyer'),
  ];
  SearchSuggestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TagsView(
      tags: tags,
    );
  }
}
