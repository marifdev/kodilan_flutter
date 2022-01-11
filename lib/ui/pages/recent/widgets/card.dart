import 'package:flutter/material.dart';
import 'package:kodilan_flutter/ui/pages/recent/widgets/company_logo.dart';
import 'package:kodilan_flutter/ui/pages/recent/widgets/job_type.dart';
import 'package:kodilan_flutter/ui/shared/colors.dart';
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
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => JobDetailsPage(data: data[index])),
          // );
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
                          CompanyInfoWidget(
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

class JobTitleWidget extends StatelessWidget {
  final String position;

  JobTitleWidget(this.position);

  @override
  Widget build(BuildContext context) {
    return Text(
      position,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}

class CompanyInfoWidget extends StatelessWidget {
  final String companyName;
  final String location;
  final String updatedAt;

  CompanyInfoWidget(this.companyName, this.location, this.updatedAt);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 0.0,
      ),
      child: Wrap(
        spacing: 8.0, // gap between adjacent chips
        runSpacing: 4.0, // gap between lines
        direction: Axis.horizontal,
        children: <Widget>[
          Wrap(
            children: <Widget>[
              const Icon(
                Icons.business_center,
                size: 15,
              ),
              Text(
                companyName,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Wrap(
            children: <Widget>[
              const Icon(
                Icons.location_on,
                size: 15,
              ),
              Text(
                location,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Wrap(
            children: <Widget>[
              const Icon(
                Icons.timer,
                size: 15,
              ),
              Text(
                updatedAt,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
