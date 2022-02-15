import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:kodilan_flutter/models/post.dart';
import 'package:kodilan_flutter/ui/pages/job_details/widgets/social_links.dart';
import 'package:kodilan_flutter/ui/pages/recent/widgets/company_logo.dart';
import 'package:kodilan_flutter/ui/shared/colors.dart';
import 'package:kodilan_flutter/ui/shared/job_title.dart';
import 'package:kodilan_flutter/ui/shared/tags_view.dart';
import 'package:kodilan_flutter/ui/shared/utils.dart';

class JobDetails extends StatelessWidget {
  final Post post;
  const JobDetails({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                                style: const TextStyle(
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
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Html(
                data: post.description,
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          color: AppColors.mainColor,
                        ),
                        const Text(
                          " Son Guncelleme: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainColor,
                          ),
                        ),
                        Text(SharedMethods().updatedAt(post))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.person_outline,
                          color: AppColors.mainColor,
                        ),
                        const Text(
                          " Pozisyon: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainColor,
                          ),
                        ),
                        Text(post.position!),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: AppColors.mainColor,
                        ),
                        const Text(
                          " Lokasyon: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainColor,
                          ),
                        ),
                        Text(post.location!),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.bookmark_outline,
                          color: AppColors.mainColor,
                        ),
                        const Text(
                          " Etiketler: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainColor,
                          ),
                        ),
                        TagsView(tags: post.tags)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.share_outlined,
                          color: AppColors.mainColor,
                        ),
                        const Text(
                          " Bağlantılar: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainColor,
                          ),
                        ),
                        SocialLinks(
                          post: post,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      primary: AppColors.mainColor,
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.mail_outline),
                        ),
                        Text('E-Posta ile Başvur'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      primary: AppColors.mainColor,
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.link_outlined),
                        ),
                        Text('Site Üzerinden Başvur'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
