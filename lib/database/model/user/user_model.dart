import 'package:movie_app/database/model/user/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {String? name,
      String? phoneNumber,
      String? email,
      String? imagePath,
      String? about})
      : super(
            name: name,
            phoneNumber: phoneNumber,
            email: email,
            imagePath: imagePath,
            about: about);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"],
      phoneNumber: json["phoneNumber"],
      email: json["email"],
      imagePath: json["imagePath"],
      about: json["about"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "phoneNumber": phoneNumber,
      "email": email,
      "imagePath": imagePath,
      "about": about,
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'MessageModel(name: $name,phoneNumber: $phoneNumber,email: $email,imagePath: $imagePath,about: $about)';
  }
}
