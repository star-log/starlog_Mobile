import 'package:flutter/material.dart';
import 'package:starlog_mobile/core/constants/color.dart';
import 'package:starlog_mobile/core/constants/text_style.dart';

class LuckyInfoItem extends StatelessWidget {
  final Color color;
  final String text;
  final String value;

  const LuckyInfoItem({
    super.key,
    required this.color,
    required this.text,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: StarlogColor.white,
            border: Border.all(color: color, width: 1.5)
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22.5),
                color: color
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Text(text, style: StarlogTextStyle.body2.copyWith(color: StarlogColor.white),),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(value, style: StarlogTextStyle.body2.copyWith(fontWeight: FontWeight.w400)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
