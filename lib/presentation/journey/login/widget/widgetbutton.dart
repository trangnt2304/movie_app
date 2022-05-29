import 'package:flutter/material.dart';
import 'package:movie_app/common/constant/colors.dart';
import 'package:movie_app/common/constant/text_style.dart';
import 'package:movie_app/generated/l10n.dart';

class NewWidgetButton extends StatelessWidget {
  const NewWidgetButton({
    Key? key,
    required this.color,
    required this.voidCallback,
    required this.string,
  }) : super(key: key);

  final Color color;
  final VoidCallback voidCallback;
  final String string;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            string,
            style: AppTextStyle.movieRateTile
                .copyWith(fontWeight: FontWeight.normal),
          ),
        ),
        onPressed: voidCallback,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(AppColors.background)),
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

