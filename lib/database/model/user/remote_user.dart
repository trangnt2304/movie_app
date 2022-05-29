import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app/database/model/user/user_model.dart';

class RemoteUser {
  //cach viet 1 singleton
  RemoteUser._init();
  static final RemoteUser instance = RemoteUser._init();

  //tra ve 1 collection voi tham so truyen vao la String
  CollectionReference collectionReference(String collection) {
    return FirebaseFirestore.instance.collection(collection);
  }

  Future<List<UserModel?>> getUser() async {
    final List<UserModel?> users = [];
    final collectionUser = await collectionReference('user')
        .orderBy('email', descending: false)
        .get();
    for (final user in collectionUser.docs) {
      final userModel = UserModel.fromJson(user.data() as Map<String, dynamic>);
      users.add(userModel);
    }
    print(users);
    return users;
  }
}
