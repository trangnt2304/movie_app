import 'package:movie_app/database/model/user/user_model.dart';

class UserEntity {
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? imagePath;
  final String? about;

  UserEntity(
      {this.name, this.email, this.phoneNumber, this.imagePath, this.about});

  UserModel toModel() {
    return UserModel(
        name: name,
        phoneNumber: phoneNumber,
        imagePath: imagePath,
        about: about,
        email: email);
  }
}
