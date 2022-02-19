import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:kodilan_flutter/models/post.dart';
import 'package:kodilan_flutter/ui/shared/types.dart';

List<Post> parsePosts(String responseBody) {
  final parsed = jsonDecode(responseBody)['data'].cast<Map<String, dynamic>>();

  return parsed.map<Post>((json) => Post.fromJson(json)).toList();
}

Future<List<Post>> getSearchedPosts(query, location) async {
  final response = await http.get(Uri.parse(
      'https://api.kodilan.com/search?query=$query&location=$location'));
  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePosts, response.body);
}

Future<List<Post>> getTagPosts(String tag) async {
  final response =
      await http.get(Uri.parse('https://api.kodilan.com/tags/$tag/posts'));
  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePosts, response.body);
}

Future<List<Post>> getLocationPosts(String location) async {
  final response = await http
      .get(Uri.parse('https://api.kodilan.com/search?location=$location'));
  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePosts, response.body);
}

Future<List<Post>> getCompanyPosts(String companySlug) async {
  final response = await http
      .get(Uri.parse('https://api.kodilan.com/companies/$companySlug/posts'));
  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePosts, response.body);
}

Future<List<Post>> getTypePosts(String type) async {
  var typeNumber = types[type];
  final response = await http
      .get(Uri.parse('https://api.kodilan.com/search?type=$typeNumber'));
  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePosts, response.body);
}
