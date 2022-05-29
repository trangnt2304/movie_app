
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:movie_app/common/constant/text_style.dart';
import 'package:movie_app/presentation/journey/home/home_widget.dart';
import 'package:movie_app/presentation/journey/login/widget/widgetbutton.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('assets/icons/ic.png'),
                  ),
                ),
                const SizedBox(
                  height: 48.0,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kbuildInputDecoration('Nhập email'),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kbuildInputDecoration('Nhập mật khẩu'),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                NewWidgetButton(
                    color: Colors.lightBlueAccent,
                    voidCallback: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final signInUser = await _auth.signInWithEmailAndPassword(email: email!, password: password!);
                        if(signInUser!=null){
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) => const MyHomePage()));
                        }
                      } catch (e){
                        print(e);
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    },
                    string: 'Đăng nhập'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
