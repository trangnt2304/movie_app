import 'package:flutter/material.dart';
import 'package:movie_app/common/constant/colors.dart';
import 'package:movie_app/common/constant/images.dart';
import 'package:movie_app/common/constant/text_style.dart';
import 'package:movie_app/database/model/user/remote_user.dart';
import 'package:movie_app/database/model/user/user_model.dart';
import 'package:movie_app/presentation/journey/profile/edit_profile/edit_profile_page.dart';
import 'package:movie_app/presentation/journey/profile/profile/widget/infor_widget.dart';
import 'package:movie_app/presentation/journey/profile/widget/profile_widget.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? onChangeName;
  String? onChangePhoneNumber;
  String? onChangeEmail;
  String? onChangeAbout;

  final remoteUser = RemoteUser.instance.getUser();
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color(AppColors.background),
        title: const Text('Thông tin cá nhân'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder<List<UserModel?>>(
            future: remoteUser,
            builder: (context, snapshot) {
              final userModel = snapshot.data?[0];
              return ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  ProfileWidget(
                    imagePath: AppImages.imgPicHomeScreen,
                    onClicked: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const EditProfilePage()),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Họ và tên',
                          style: AppTextStyle.movieTitle
                              .copyWith(color: Colors.black, fontSize: 18),
                        ),
                        InforWidget(
                          title: userModel?.name,
                          width: width,
                        ),
                        Text(
                          'Số điện thoại',
                          style: AppTextStyle.movieTitle
                              .copyWith(color: Colors.black, fontSize: 18),
                        ),
                        InforWidget(
                          title: userModel?.phoneNumber,
                          width: width,
                        ),
                        Text(
                          'Email',
                          style: AppTextStyle.movieTitle
                              .copyWith(color: Colors.black, fontSize: 18),
                        ),
                        InforWidget(
                          title: userModel?.email,
                          width: width,
                        ),
                        Text(
                          'Thông tin cá nhân',
                          style: AppTextStyle.movieTitle
                              .copyWith(color: Colors.black, fontSize: 18),
                        ),
                        InforWidget(
                          title: userModel?.about,
                          width: width,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
