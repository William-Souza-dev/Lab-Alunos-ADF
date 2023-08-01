import 'dart:convert';

import 'address_model.dart';
import 'courses.model.dart';

class StudentsModel {
  final int? id;
  final String name;
  final int? age;
  final List<String> nameCourses;
  final List<CoursesModel> courses;
  final AddressModel address;
  StudentsModel({
    this.id,
    required this.name,
    this.age,
    required this.nameCourses,
    required this.courses,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'id': id,
      'name': name,
      'age': age,
      'nameCourses': nameCourses,
      'courses': courses.map((courses) => courses.toMap()).toList(),
      'address': address.toMap(),
    };
    if (age != null) {
      map['age'] = age;
    }
    return map;
  }

  String toJson() => jsonEncode(toMap());

  factory StudentsModel.fromMap(Map<String, dynamic> map) {
    return StudentsModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      nameCourses: List<String>.from((map['nameCourses'] ?? <String>[])),
      address: AddressModel.fromMap(map['address'] ?? <String, dynamic>{}),
      courses: map['courses']
              ?.map<CoursesModel>(
                  (coursesMap) => CoursesModel.fromMap(coursesMap))
              .toList() ??
          <CoursesModel>[],
    );
  }
  factory StudentsModel.fromJson(String json) =>
      StudentsModel.fromMap(jsonDecode(json));
}
