import 'package:flutter/material.dart';
import 'package:movie_app/common/constant/colors.dart';

class AppTextStyle {
  static const movieTitle = TextStyle(
      color: Color(AppColors.white), fontSize: 24, fontWeight: FontWeight.bold);
  static const movieRateTile = TextStyle(
      color: Color(AppColors.white), fontSize: 18, fontWeight: FontWeight.bold);
  static const movieRateSub =
      TextStyle(color: Color(AppColors.movieSubTitle), fontSize: 14);
}


const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

InputDecoration kbuildInputDecoration(String string) {
  return InputDecoration(
    // hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
    hintText: string,
    contentPadding:
    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide:
      BorderSide(color: Colors.lightBlueAccent, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide:
      BorderSide(color: Colors.lightBlueAccent, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
  );
}