import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:kodilan_flutter/models/post.dart';

List<Post> parsePosts(String responseBody) {
  final parsed = jsonDecode(responseBody)['data'].cast<Map<String, dynamic>>();

  return parsed.map<Post>((json) => Post.fromJson(json)).toList();
}

Future<List<Post>> getRecentPosts() async {
  final response = await http.get(Uri.parse('https://api.kodilan.com/posts'));
  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePosts, response.body);
}
