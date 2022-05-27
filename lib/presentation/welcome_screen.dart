
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:movie_app/common/constant/colors.dart';
import 'package:movie_app/presentation/journey/login/login_widget.dart';
import 'package:movie_app/presentation/journey/login/widget/widgetbutton.dart';
import 'package:movie_app/presentation/journey/register/register_widget.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation? animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      upperBound: 1,
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animationController?.forward();
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(animationController!);
    animationController?.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation!.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    child: Image.asset('assets/icons/ic.png'),
                    height: 60,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: const ['BHD Cinema'],
                  textStyle: const TextStyle(
                    fontSize: 40.0,
                    color: Color(AppColors.chineseBlue),
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            NewWidgetButton(
              color: Colors.lightBlueAccent,
              voidCallback: () {
                //Go to login screen.
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              string: 'Đăng nhập',
            ),
            NewWidgetButton(
                color: Colors.blueAccent,
                voidCallback: () {
                  //Go to registration screen.
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegistrationScreen()),
                  );
                },
                string: 'Đăng ký'),
          ],
        ),
      ),
    );
  }
}

