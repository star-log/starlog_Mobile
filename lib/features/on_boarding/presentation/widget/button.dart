import 'package:flutter/material.dart';
import 'package:starlog_mobile/core/constants/text_style.dart';

class StarlogButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onTap;

  const StarlogButton({
    super.key,
    required this.text,
    required this.color,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        child: Center(child: Text(text, style: StarlogTextStyle.body1)),
      ),
    );
  }
}
