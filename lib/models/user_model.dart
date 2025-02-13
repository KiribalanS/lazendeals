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
}

enum Gender { male, female, others }

UserModel userModel =
    UserModel(name: "User Name", mail: "User Mail", phone: "+91 9894698946");
