import 'package:flutter/material.dart';
import 'package:starlog_mobile/core/constants/color.dart';
import 'package:starlog_mobile/features/fortune/presentation/widget/star_rating.dart';

class LuckyScoreCard extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final Widget icon;
  final int rank;

  const LuckyScoreCard({
    super.key,
    required this.backgroundColor,
    required this.borderColor,
    required this.icon,
    required this.rank,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor, width: 1),
        color: backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: StarlogColor.white,
                ),
                child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: StarRating(count: rank, size: 16,)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
