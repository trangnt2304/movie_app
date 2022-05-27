import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {Key? key,
      required this.onChange,
      required this.title,
      required this.hint,
      this.lines})
      : super(key: key);

  final Function(String value) onChange;
  final String title;
  final String hint;
  final int? lines;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(
          height: 4,
        ),
        TextField(
          onChanged: onChange,
          maxLines: lines ?? 1,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            hintText: hint,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: Colors.redAccent,
                width: 3,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
