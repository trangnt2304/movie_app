
import 'package:flutter/material.dart';
import 'package:movie_app/common/constant/colors.dart';
import 'package:movie_app/common/constant/icons.dart';

class ScaffoldWidget extends StatelessWidget {
  const ScaffoldWidget({
    Key? key, required this.child,
  }) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(AppColors.background),
        elevation: 0,
        shadowColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset(AppIcons.icSearch,height: 20,width: 20,),
          ),
        ],
        title: const Text("Movies"),
        centerTitle: true,
      ),
      body: Center(
        child: child,
      ),
    );
  }
}