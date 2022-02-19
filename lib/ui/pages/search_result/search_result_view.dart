import 'package:flutter/material.dart';
import 'package:kodilan_flutter/ui/pages/search_result/search_result_viewmodel.dart';

import '../../shared/colors.dart';
import '../recent/widgets/card.dart';

class SearchResult extends StatelessWidget {
  final String? tag;
  final String? location;
  final String? company;
  const SearchResult({Key? key, this.tag, this.location, this.company})
      : super(key: key);

  getSearchResults(tag, location, company) {
    if (tag != null) {
      return getTagPosts(tag);
    } else if (location != null) {
      return getLocationPosts(location);
    } else if (company != null) {
      return getCompanyPosts(company);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Arama Sonuçları"),
        backgroundColor: AppColors.mainColor,
      ),
      body: FutureBuilder(
        future: getSearchResults(tag, location, company),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
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
            return const Text(
                "You have an error. Are you sure about the api ?");
          }
        },
      ),
    );
  }
}
