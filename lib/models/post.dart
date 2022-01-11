import 'package:kodilan_flutter/models/company.dart';
import 'package:kodilan_flutter/models/tags.dart';

class Post {
  String? slug;
  String? position;
  String? description;
  String? applyUrl;
  String? applyEmail;
  String? location;
  int? type;
  int? status;
  int? isFeatured;
  String? createdAt;
  String? updatedAt;
  String? postUrl;
  Company? company;
  List<Tags>? tags;

  Post(
      {this.slug,
      this.position,
      this.description,
      this.applyUrl,
      this.applyEmail,
      this.location,
      this.type,
      this.status,
      this.isFeatured,
      this.createdAt,
      this.updatedAt,
      this.postUrl,
      this.company,
      this.tags});

  Post.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    position = json['position'];
    description = json['description'];
    applyUrl = json['apply_url'];
    applyEmail = json['apply_email'];
    location = json['location'];
    type = json['type'];
    status = json['status'];
    isFeatured = json['is_featured'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    postUrl = json['post_url'];
    company =
        json['company'] != null ? Company.fromJson(json['company']) : null;
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slug'] = slug;
    data['position'] = position;
    data['description'] = description;
    data['apply_url'] = applyUrl;
    data['apply_email'] = applyEmail;
    data['location'] = location;
    data['type'] = type;
    data['status'] = status;
    data['is_featured'] = isFeatured;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['post_url'] = postUrl;
    if (company != null) {
      data['company'] = company!.toJson();
    }
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
