import 'package:flutter/material.dart';
import 'package:kodilan_flutter/ui/pages/job_details/job_details_view.dart';
import 'package:kodilan_flutter/ui/pages/recent/widgets/company_logo.dart';
import 'package:kodilan_flutter/ui/pages/recent/widgets/job_type.dart';
import 'package:kodilan_flutter/ui/pages/recent/widgets/post_info.dart';
import 'package:kodilan_flutter/ui/shared/job_title.dart';
import 'package:kodilan_flutter/ui/shared/utils.dart';

import '../../../shared/tags_view.dart';

class RecentCard extends StatelessWidget {
  final dynamic data;
  final int index;

  const RecentCard(this.data, this.index, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var post = data[index];
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => JobDetails(post: post)),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        JobTitleWidget(post.position),
                        JobTypeWidget(post.type),
                        PostInfoWidget(
                          post.company.name,
                          post.location,
                          SharedMethods().updatedAt(post),
                        ),
                        TagsView(tags: post.tags),
                      ],
                    ),
                  ),
                  CompanyLogoWidget(post.company, 40, 40),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// List<String> _tags(dynamic job) {
//   List<String> tagList = job['tags'].map((s) => s as String).toList();
//   return tagList;
// }
