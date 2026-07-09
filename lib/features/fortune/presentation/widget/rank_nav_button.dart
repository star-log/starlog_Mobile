import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:starlog_mobile/core/constants/color.dart';
import 'package:starlog_mobile/core/constants/text_style.dart';
import 'package:starlog_mobile/core/enums/zodiac.dart';

class RankNavButton extends StatelessWidget {
  final int rank;
  final Zodiac zodiac;
  final bool isPrev;
  final VoidCallback onTap;

  const RankNavButton({
    super.key,
    required this.rank,
    required this.zodiac,
    required this.isPrev,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final arrow = isPrev
        ? Symbols.play_arrow_rounded
        : Symbols.play_arrow_rounded;

    final padding = isPrev
        ? const EdgeInsets.only(left: 80, right: 20)
        : const EdgeInsets.only(left: 20, right: 80);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 130,
        padding: padding,
        decoration: BoxDecoration(
          color: StarlogColor.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: StarlogColor.black.withValues(alpha: 0.08),
              blurRadius: 12,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:
              isPrev ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isPrev)
                  Transform.flip(
                    flipX: true,
                    child: Icon(arrow, size: 22, color: StarlogColor.grayText, fill: 1,),
                  ),
                if (isPrev) const SizedBox(width: 2),
                Text('$rank위', style: StarlogTextStyle.title1),
                if (!isPrev) const SizedBox(width: 2),
                if (!isPrev) Icon(arrow, size: 22, color: StarlogColor.grayText, fill: 1,),
              ],
            ),
            const SizedBox(height: 2),
            FittedBox(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(zodiac.icon, color: zodiac.color, size: 20),
                  const SizedBox(width: 4),
                  Text(zodiac.label, style: StarlogTextStyle.subTitle2.copyWith(fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
