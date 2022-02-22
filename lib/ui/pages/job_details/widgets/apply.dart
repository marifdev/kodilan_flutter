import 'package:flutter/material.dart';
import 'package:kodilan_flutter/models/post.dart';
import 'package:kodilan_flutter/ui/shared/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class Apply extends StatelessWidget {
  final Post post;
  const Apply({
    Key? key,
    required this.post,
  }) : super(key: key);

  void onPressUrl(url) {
    _launchURL(url);
  }

  void _launchURL(_url) async {
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      print('Could not launch $_url');
    }
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  void onPressEmail(email, position) {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      query: encodeQueryParameters(<String, String>{
        'subject': '$position Başvurusu',
        'body': '%0A%0A%0A%0A-%0Akodilan.com aracılığıyla gönderilmiştir'
      }),
    );
    _launchURL(emailLaunchUri.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          if (post.applyEmail != null)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                primary: AppColors.mainColor,
              ),
              onPressed: () {
                onPressEmail(post.applyEmail, post.position);
              },
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
          if (post.applyUrl != null)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                primary: AppColors.mainColor,
              ),
              onPressed: () {
                onPressUrl(post.applyUrl);
              },
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
    );
  }
}
