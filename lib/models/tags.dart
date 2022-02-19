class Tags {
  String? name;
  String? slug;
  String? type;

  Tags({this.name, this.slug, this.type});

  Tags.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['slug'] = slug;
    return data;
  }
}
