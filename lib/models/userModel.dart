class UserModel {
  String id;
  String name;
  String email;
  String gender;
  String phoneNumber;

  UserModel({this.id, this.name, this.email, this.gender, this.phoneNumber});

  UserModel.fromData(Map<String, dynamic> data)
      : id = data['id'],
        name = data['name'],
        email = data['email'],
        gender = data["gender"],
        phoneNumber = data["phoneNumber"];

  static UserModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserModel(
        id: map['id'],
        name: map['name'],
        email: map['email'],
        gender: map['gender'],
        phoneNumber: map['phoneNumber']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'gender': gender,
      'phoneNumber': phoneNumber,
    };
  }
}
