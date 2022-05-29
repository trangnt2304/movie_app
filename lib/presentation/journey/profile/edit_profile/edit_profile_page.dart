import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/constant/colors.dart';
import 'package:movie_app/common/constant/images.dart';
import 'package:movie_app/database/model/user/remote_user.dart';
import 'package:movie_app/presentation/journey/home/widget/home_widget/ticket_button_widget.dart';
import 'package:movie_app/database/model/user/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app/presentation/journey/profile/profile/profile_page.dart';
import 'package:movie_app/presentation/journey/profile/widget/profile_widget.dart';
import 'package:movie_app/presentation/journey/profile/widget/textfield_widget.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _firestore = FirebaseFirestore.instance;
  String? onChangeName;
  String? onChangePhoneNumber;
  String? onChangeEmail;
  String? onChangeAbout;

  final remoteUser = RemoteUser.instance.getUser();
  @override
  Widget build(BuildContext context) => Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: const Color(AppColors.background),
            title: const Text('Sửa thông tin cá nhân'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: FutureBuilder<List<UserModel?>>(
              future: remoteUser,
              builder: (context, snapshot) {
                final user = snapshot.data?[0];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    physics: const BouncingScrollPhysics(),
                    children: [
                      ProfileWidget(
                        imagePath: AppImages.imgPicHomeScreen,
                        isEdit: true,
                        onClicked: () async {},
                      ),
                      const SizedBox(height: 24),
                      TextFieldWidget(
                          onChange: (value) {
                            onChangeName = value;
                          },
                          title: 'Nhập tên',
                          hint: user?.name ?? 'Điền họ và tên'),
                      const SizedBox(height: 24),
                      TextFieldWidget(
                          onChange: (value) {
                            onChangePhoneNumber = value;
                          },
                          title: 'Nhập số điện thoại',
                          hint: user?.phoneNumber ?? 'Điền số điện thoại'),
                      const SizedBox(height: 24),
                      TextFieldWidget(
                          onChange: (value) {
                            onChangeEmail = value;
                          },
                          title: 'Nhập email',
                          hint: user?.email ?? 'Điền email'),
                      const SizedBox(height: 24),
                      TextFieldWidget(
                        onChange: (value) {
                          onChangeAbout = value;
                        },
                        title: 'Vài điều về bản thân',
                        hint: user?.about ?? 'Giới thiệu về bản thân',
                        lines: 5,
                      ),
                      const SizedBox(height: 24),
                      TicketButtonWidget(
                        colorButton: AppColors.background,
                        title: 'Xác nhận',
                        onPressed: () {
                          final userModel = UserModel(
                                  name: onChangeName,
                                  phoneNumber: onChangePhoneNumber,
                                  imagePath: '',
                                  about: onChangeAbout,
                                  email: onChangeEmail)
                              .toJson();
                          _firestore.collection('user').add(userModel);

                          showDialog(
                              context: context,
                              builder: (context) {
                                return CupertinoAlertDialog(
                                  title: const Text('Sửa thông tin thành công'),
                                  content: const Text('Thông tin đã được sửa'),
                                  actions: [
                                    TextButton(
                                        onPressed: () async {
                                          await FirebaseAuth.instance.signOut();
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      const ProfilePage()));
                                        },
                                        child: const Text('Xác nhận')),
                                  ],
                                );
                              });
                        },
                      ),
                    ],
                  ),
                );
              }),
        ),
      );
}
