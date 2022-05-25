import 'package:flutter/material.dart';
import 'package:movie_app/common/constant/colors.dart';
import 'package:movie_app/common/constant/text_style.dart';
import 'package:movie_app/generated/l10n.dart';

class TicketButtonWidget extends StatelessWidget {
  const TicketButtonWidget({
    Key? key, required this.colorButton,
  }) : super(key: key);
  final int colorButton;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Text(S().buyTickets,style: AppTextStyle.movieRateTile,),
      ),
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(colorButton)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            side: const BorderSide(color: Color(AppColors.white)),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}