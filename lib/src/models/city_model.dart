import 'dart:convert';

class CityModel {
  int id;
  String name;
  CityModel({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
    );
  }
  factory CityModel.fromJson(String json) =>
      CityModel.fromMap(jsonDecode(json));
}
