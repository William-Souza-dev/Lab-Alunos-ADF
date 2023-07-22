import 'dart:convert';

class CoursesModel {
  int id;
  String name;
  bool isStudent;
  CoursesModel({
    required this.id,
    required this.name,
    required this.isStudent,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'isStudent': isStudent};
  }

  String toJson() => jsonEncode(toMap());

  factory CoursesModel.fromMap(Map<String, dynamic> map) {
    return CoursesModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      isStudent: map['isStudent'] ?? false,
    );
  }

  factory CoursesModel.fromJson(String json) =>
      CoursesModel.fromMap(jsonDecode(json));
}
