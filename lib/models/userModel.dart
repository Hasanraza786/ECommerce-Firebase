class UserModel {
  String id;
  String name;
  String email;
  String gender;
  String phoneNumber;
  String image;
  String adress;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.gender,
      this.phoneNumber,
      this.image,
      this.adress});

  UserModel.fromData(Map<String, dynamic> data)
      : id = data['id'],
        name = data['name'],
        email = data['email'],
        gender = data["gender"],
        phoneNumber = data["phoneNumber"],
        image = data["image"],
        adress = data["adress"];

  static UserModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserModel(
        id: map['id'],
        name: map['name'],
        email: map['email'],
        gender: map['gender'],
        phoneNumber: map['phoneNumber'],
        image: map['image'],
        adress: map["adress"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'image': image,
      'adress': adress
    };
  }
}
