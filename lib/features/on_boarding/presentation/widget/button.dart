import 'package:flutter/material.dart';
import 'package:starlog_mobile/core/constants/color.dart';
import 'package:starlog_mobile/core/constants/text_style.dart';

class StarlogButton extends StatelessWidget {
  final double borderRadius;
  final String? text;
  final IconData? icon;
  final Color color;
  final VoidCallback onTap;

  const StarlogButton({
    super.key,
    this.borderRadius = 15,
    this.text,
    this.icon,
    required this.color,
    required this.onTap,
  }) : assert(text != null || icon != null, 'text 또는 icon 중 하나는 필요합니다');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: color,
        ),
        child: Center(
          child: icon != null
              ? Icon(icon, color: StarlogColor.white)
              : Text(
                  text!,
                  style: StarlogTextStyle.body1.copyWith(color: StarlogColor.white),
                ),
        ),
      ),
    );
  }
}
