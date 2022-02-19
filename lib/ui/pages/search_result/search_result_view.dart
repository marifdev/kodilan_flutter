import 'package:flutter/material.dart';
import 'package:kodilan_flutter/ui/pages/search_result/search_result_viewmodel.dart';

import '../../../models/tags.dart';
import '../../shared/colors.dart';
import '../recent/widgets/card.dart';

class SearchResult extends StatelessWidget {
  final Tags? tag;
  final String? location;
  final String? company;
  final String? query;
  const SearchResult(
      {Key? key, this.tag, this.location, this.company, this.query})
      : super(key: key);

  getSearchResults(tag, company) {
    if (tag != null) {
      if (tag.type == null || tag.type == 'tag') {
        return getTagPosts(tag.name);
      } else if (tag.type == 'location') {
        return getLocationPosts(tag.name);
      } else if (tag.type == 'jobType') {
        return getTypePosts(tag.name);
      }
    } else if (company != null) {
      return getCompanyPosts(company);
    } else if (query != null) {
      return getSearchedPosts(query, location);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Arama Sonuçları"),
        backgroundColor: AppColors.mainColor,
      ),
      body: FutureBuilder(
        future: getSearchResults(tag, company),
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
