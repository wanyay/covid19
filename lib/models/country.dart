class Country {
  String code;
  String name;

  Country({this.code, this.name});

  Country.fromJson(Map<String, dynamic> json) {
    code = json['Code'];
    name = json['Name'];
  }
}