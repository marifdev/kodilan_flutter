import 'package:flutter/material.dart';
import 'package:kodilan_flutter/ui/shared/tags_view.dart';

import '../../../../models/tags.dart';

class SearchSuggestions extends StatelessWidget {
  final List<Tags> tags = [
    Tags(name: 'Frontend', type: 'tag'),
    Tags(name: 'Backend', type: 'tag'),
    Tags(name: 'Mobile', type: 'tag'),
    Tags(name: 'DevOps', type: 'tag'),
    Tags(name: 'İstanbul', type: 'location'),
    Tags(name: 'İzmir', type: 'location'),
    Tags(name: 'Ankara', type: 'location'),
    Tags(name: 'Remote', type: 'location'),
    Tags(name: 'Tam Zamanlı', type: 'jobType'),
    Tags(name: 'Yarı Zamanlı', type: 'jobType'),
    Tags(name: 'Stajyer', type: 'jobType'),
  ];
  SearchSuggestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TagsView(
      tags: tags,
    );
  }
}
