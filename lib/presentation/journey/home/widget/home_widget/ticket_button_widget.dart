import 'package:flutter/material.dart';
import 'package:movie_app/common/constant/colors.dart';
import 'package:movie_app/common/constant/text_style.dart';
import 'package:movie_app/generated/l10n.dart';
import 'package:movie_app/presentation/journey/home/movie_detail/movie_detail_widget.dart';

class TicketButtonWidget extends StatelessWidget {
  const TicketButtonWidget({
    Key? key, required this.colorButton,
  }) : super(key: key);
  final int colorButton;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(S().buyTickets,style: AppTextStyle.movieRateTile.copyWith(fontWeight: FontWeight.normal),),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MovieDetailWidget()),
          );
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(colorButton)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              side: const BorderSide(color: Color(AppColors.white)),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}