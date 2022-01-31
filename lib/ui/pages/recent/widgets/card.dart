import 'package:flutter/material.dart';
import 'package:kodilan_flutter/ui/pages/job_details/job_details_view.dart';
import 'package:kodilan_flutter/ui/pages/recent/widgets/company_logo.dart';
import 'package:kodilan_flutter/ui/pages/recent/widgets/job_type.dart';
import 'package:kodilan_flutter/ui/pages/recent/widgets/post_info.dart';
import 'package:kodilan_flutter/ui/shared/colors.dart';
import 'package:kodilan_flutter/ui/shared/job_title.dart';
import 'package:timeago/timeago.dart' as timeago;

class RecentCard extends StatelessWidget {
  final dynamic data;
  final int index;

  const RecentCard(this.data, this.index, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var post = data[index];
    return Card(
      child: InkWell(
        splashColor: AppColors.mainColor,
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
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          JobTitleWidget(post.position),
                          JobTypeWidget(post.type),
                          PostInfoWidget(
                            post.company.name,
                            post.location,
                            _updatedAt(post),
                          )
                        ],
                      ),
                    ),
                  ),
                  CompanyLogoWidget(post.company.logo, 40, 40),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<String> _tags(dynamic job) {
  List<String> tagList = job['tags'].map((s) => s as String).toList();
  return tagList;
}

String _updatedAt(dynamic job) {
  timeago.setLocaleMessages('tr', timeago.TrMessages());
  return timeago.format(DateTime.parse(job.updatedAt), locale: 'tr');
}
