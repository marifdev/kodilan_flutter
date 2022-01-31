import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:kodilan_flutter/models/post.dart';
import 'package:kodilan_flutter/ui/pages/recent/widgets/company_logo.dart';
import 'package:kodilan_flutter/ui/shared/colors.dart';
import 'package:kodilan_flutter/ui/shared/job_title.dart';

class JobDetails extends StatelessWidget {
  final Post post;
  JobDetails({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(post);
    return Scaffold(
      appBar: AppBar(
        title: Text(post.position!),
        backgroundColor: AppColors.mainColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      CompanyLogoWidget(post.company!.logo!, 80, 80),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                post.company!.name!,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              JobTitleWidget(post.position!),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Html(
                data: post.description,
              ),
            ),
            Divider(),
            Column(
              children: [
                Text(
                  "Son Guncelleme: ",
                ),
                //TODO: Addpost info and apply buttons
              ],
            ),
          ],
        ),
      ),
    );
  }
}
