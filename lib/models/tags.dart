class Tags {
  String? name;
  String? slug;

  Tags({this.name, this.slug});

  Tags.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['slug'] = slug;
    return data;
  }
}
