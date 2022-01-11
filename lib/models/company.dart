class Company {
  String? name;
  String? slug;
  String? logo;
  String? www;
  String? twitter;
  String? linkedin;

  Company(
      {this.name, this.slug, this.logo, this.www, this.twitter, this.linkedin});

  Company.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    logo = json['logo'];
    www = json['www'];
    twitter = json['twitter'];
    linkedin = json['linkedin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['slug'] = slug;
    data['logo'] = logo;
    data['www'] = www;
    data['twitter'] = twitter;
    data['linkedin'] = linkedin;
    return data;
  }
}
