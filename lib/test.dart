import 'dart:convert';

main() {
  String value =
      '[{ "name":"John", "age":30, "city":"New York"},{ "name":"John", "age":30, "city":"New York"}]';

  List data = json.decode(value);
  data.forEach((f) => print(f));
}
