import 'dart:convert';

class UserModel {
  String name;
  String mail;
  String phone;
  String? address;
  int? pincode;
  Gender? gender;
  String? sessionId;
  String? userId;

  UserModel({
    this.sessionId,
    this.userId,
    required this.name,
    required this.mail,
    required this.phone,
    this.address,
    this.gender,
    this.pincode,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'mail': mail,
      'phone': phone,
      'address': address,
      'pincode': pincode,
      'gender': gender?.toString(),
      'sessionId': sessionId,
      'userId': userId,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (map['gender'] == 'male') {
      return UserModel(
        name: map['name'] ?? '',
        mail: map['mail'] ?? '',
        phone: map['phone'] ?? '',
        address: map['address'],
        pincode: map['pincode']?.toInt(),
        gender: Gender.male,
        sessionId: map['sessionId'],
        userId: map['userId'],
      );
    }
    return UserModel(
      name: map['name'] ?? '',
      mail: map['mail'] ?? '',
      phone: map['phone'] ?? '',
      address: map['address'],
      pincode: map['pincode']?.toInt(),
      gender: Gender.female,
      sessionId: map['sessionId'],
      userId: map['userId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}

enum Gender { male, female, others }

UserModel userModel =
    UserModel(name: "User Name", mail: "User Mail", phone: "+91 9894698946");
