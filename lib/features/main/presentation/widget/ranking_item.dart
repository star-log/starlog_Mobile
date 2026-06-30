import 'package:flowbite_icons/flowbite_icons.dart';
import 'package:flutter/material.dart';
import 'package:starlog_mobile/core/constants/color.dart';
import 'package:starlog_mobile/core/constants/text_style.dart';
import 'package:starlog_mobile/core/enums/zodiac.dart';

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

  int get _starCount => switch (rank) {
    1 => 5,
    2 || 3 => 4,
    4 || 5 || 6 || 7 => 3,
    8 || 9 || 10 || 11 => 2,
    _ => 1,
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  Text(zodiac.dateRange, style: StarlogTextStyle.body3.copyWith(color: StarlogColor.grayText),),
                  Row(
                    children: [
                      Icon(zodiac.icon, color: zodiac.color,),
                      Text(zodiac.label, style: StarlogTextStyle.body1,)
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                children: List.generate(
                    _starCount,
                    (_) => Icon(FlowbiteSolidIcons.star, size: 20, color: StarlogColor.star,)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
