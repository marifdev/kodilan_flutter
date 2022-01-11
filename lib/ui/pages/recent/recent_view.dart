import 'package:flutter/material.dart';
import 'package:kodilan_flutter/ui/pages/recent/widgets/card.dart';
import 'package:kodilan_flutter/ui/pages/recent/recent_viewmodel.dart';

class Recent extends StatelessWidget {
  const Recent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getRecentPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return RecentCard(snapshot.data!, index);
              },
            );
          } else {
            return const Text("You have an error.");
          }
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Text("You have an error. Are you sure about the api ?");
        }
      },
    );
  }
}
