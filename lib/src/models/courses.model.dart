import 'dart:convert';

class CourseModel {
  int id;
  String name;
  bool isStudent;
  CourseModel({
    required this.id,
    required this.name,
    required this.isStudent,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isStudent': isStudent,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      isStudent: map['isStudent'] ?? false,
    );
  }

  factory CourseModel.fromJson(String json) =>
      CourseModel.fromMap(jsonDecode(json));
}
