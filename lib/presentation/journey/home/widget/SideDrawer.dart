import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/constant/colors.dart';
import 'package:movie_app/presentation/journey/home/home_widget.dart';
import 'package:movie_app/presentation/journey/profile/profile/profile_page.dart';
import 'package:movie_app/presentation/welcome_screen.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          const DrawerHeader(
            child: Center(
              child: Text(
                'Cài đặt',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            decoration: BoxDecoration(
              color: Color(AppColors.background),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Trang chủ'),
            onTap: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => MyHomePage()))
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_add_alt),
            title: const Text('Thông tin cá nhân'),
            onTap: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const ProfilePage()))
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Đăng xuất'),
            onTap: () => {
              showDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: const Text('Đăng xuất'),
                      content: const Text('Bạn có thực sự muốn đăng xuất?'),
                      actions: [
                        TextButton(
                            onPressed: () async {
                              await FirebaseAuth.instance.signOut();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => WelcomeScreen()));
                            },
                            child: const Text('Có')),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); //close Dialog
                          },
                          child: const Text('Bỏ qua'),
                        )
                      ],
                    );
                  }),
            },
          ),
        ],
      ),
    );
  }
}
