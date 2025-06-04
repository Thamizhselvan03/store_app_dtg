import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final String info;
  final String title;
  const CustomRichText({super.key, required this.info, required this.title});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: '$info ',
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
            children: [
              TextSpan(

                text: title,
                style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w300, color: Colors.white70),
              )
            ]));
  }
}
