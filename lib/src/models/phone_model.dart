import 'dart:convert';

class PhoneModel {
  int ddd;
  String phone;
  PhoneModel({
    required this.ddd,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'ddd': ddd,
      'phone': phone,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory PhoneModel.fromMap(Map<String, dynamic> map) {
    return PhoneModel(
      ddd: map['ddd'] ?? 0,
      phone: map['phone'] ?? '',
    );
  }
  factory PhoneModel.fromJson(String json) =>
      PhoneModel.fromMap(jsonDecode(json));
}
