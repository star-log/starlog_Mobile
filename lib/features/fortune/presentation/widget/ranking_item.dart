import 'package:flutter/material.dart';
import 'package:starlog_mobile/core/constants/color.dart';
import 'package:starlog_mobile/core/constants/text_style.dart';
import 'package:starlog_mobile/core/enums/zodiac.dart';
import 'package:starlog_mobile/core/utils/star_util.dart';
import 'package:starlog_mobile/features/fortune/presentation/widget/my_badge.dart';
import 'package:starlog_mobile/features/fortune/presentation/widget/star_rating.dart';

class RankingItem extends StatelessWidget {
  final int rank;
  final Zodiac zodiac;
  final bool isMySign;

  const RankingItem({
    super.key,
    required this.rank,
    required this.zodiac,
    this.isMySign = false,
  });

  Color get _rankColor => switch (rank) {
    1 => RankingColor.first,
    2 => RankingColor.second,
    3 => RankingColor.third,
    _ => RankingColor.other,
  };

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: StarlogColor.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [_rankColor, StarlogColor.white],
                      stops: const [0.5, 1.0],
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(28),
                      child: Center(
                        child: Text(
                          '$rank',
                          style: StarlogTextStyle.subTitle1.copyWith(
                            color: StarlogColor.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        zodiac.dateRange,
                        style: StarlogTextStyle.body3.copyWith(
                          color: StarlogColor.grayText,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(zodiac.icon, color: zodiac.color),
                          Text(zodiac.label, style: StarlogTextStyle.body1),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: StarRating(count: starCountFromRank(rank))
                ),
              ],
            ),
          ),
        ),
        if (isMySign)
          Positioned(
            top: -15,
            right: 10,
            child: CustomPaint(
              painter: MyBadgePainter(),
              size: const Size(50, 40),
              child: SizedBox(
                width: 50,
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Center(
                    child: Text(
                      'MY',
                      style: StarlogTextStyle.body3.copyWith(
                        fontWeight: FontWeight.w700,
                        color: StarlogColor.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
