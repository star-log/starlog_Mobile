import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:ming_cute_icons/ming_cute_icons.dart';
import 'package:starlog_mobile/core/constants/app_assets.dart';
import 'package:starlog_mobile/core/constants/color.dart';
import 'package:starlog_mobile/core/constants/text_style.dart';
import 'package:starlog_mobile/core/enums/fortune_color.dart';
import 'package:starlog_mobile/core/enums/zodiac.dart';
import 'package:starlog_mobile/core/utils/star_util.dart';
import 'package:starlog_mobile/core/widgets/app_background.dart';
import 'package:starlog_mobile/core/widgets/custom_async_value.dart';
import 'package:starlog_mobile/features/fortune/presentation/view_model/fortune_detail_view_model.dart';
import 'package:starlog_mobile/features/fortune/presentation/view_model/fortune_view_model.dart';
import 'package:starlog_mobile/features/fortune/presentation/widget/lucky_info_item.dart';
import 'package:starlog_mobile/features/fortune/presentation/widget/lucky_score_card.dart';
import 'package:starlog_mobile/features/fortune/presentation/widget/rank_nav_button.dart';
import 'package:starlog_mobile/features/fortune/presentation/widget/star_rating.dart';

class FortuneDetailView extends ConsumerWidget {
  final int fortuneId;

  const FortuneDetailView({super.key, required this.fortuneId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String now = DateFormat('M월 d일').format(DateTime.now());
    final list = ref.watch(mainViewModelProvider).value;

    return AppBackground(
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: CustomAsyncValue(
            value: ref.watch(fortuneDetailViewModelProvider(fortuneId)),
            data: (value) => Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(
                    children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.pop();
                        },
                        child: Icon(
                          Symbols.arrow_back_ios_rounded,
                          color: StarlogColor.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '$now ',
                                style: StarlogTextStyle.body1.copyWith(
                                  color: StarlogColor.white,
                                ),
                              ),
                              TextSpan(
                                text: '오늘의 ${value.zodiac.label} 운세 ',
                                style: StarlogTextStyle.body1.copyWith(
                                  color: StarlogColor.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SvgPicture.asset(
                        StarlogAppAssets.splashStar,
                        width: 16,
                        height: 16,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 110),
                      child: Center(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: StarlogColor.white,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        value.zodiac.icon,
                                        color: value.zodiac.color,
                                        size: 42,
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        value.zodiac.label,
                                        style: StarlogTextStyle.subTitle2,
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        '(${value.zodiac.dateRange})',
                                        style: StarlogTextStyle.body3.copyWith(
                                          color: StarlogColor.grayText,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      alignment: Alignment.centerRight,
                                      child: StarRating(
                                        count: starCountFromRank(value.rank),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 20),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: StarlogColor.grayBox,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 28,
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          value.description,
                                          style: StarlogTextStyle.body3,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 3),
                                child: GridView(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisExtent: 40,
                                        mainAxisSpacing: 5,
                                        crossAxisSpacing: 5
                                      ),
                                  children: [
                                    LuckyScoreCard(
                                      backgroundColor: LuckyColor.money,
                                      icon: Icon(
                                        Symbols.money_bag_rounded,
                                        fill: 1,
                                        color: StarlogColor.white,
                                      ),
                                      rank: value.moneyScore,
                                      borderColor: LuckyColor.moneyBorder,
                                    ),
                                    LuckyScoreCard(
                                      backgroundColor: LuckyColor.love,
                                      icon: Icon(MingCuteIcons.mgc_love_fill, color: StarlogColor.white),
                                      rank: value.loveScore,
                                      borderColor: LuckyColor.loveBorder,
                                    ),
                                    LuckyScoreCard(
                                      backgroundColor: LuckyColor.work,
                                      icon: SvgPicture.asset(StarlogAppAssets.work),
                                      rank: value.workScore,
                                      borderColor: LuckyColor.workBorder,
                                    ),
                                    LuckyScoreCard(
                                      backgroundColor: LuckyColor.health,
                                      icon: Icon(Symbols.exercise, color: StarlogColor.white, fill: 1),
                                      rank: value.healthScore,
                                      borderColor: LuckyColor.healthBorder,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: LuckyInfoItem(
                                  color: value.luckyColor.color,
                                  text: '행운의 컬러',
                                  value: value.luckyColor.label,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5, bottom: 30),
                                child: LuckyInfoItem(
                                  color: LuckyColor.key,
                                  text: '행운의 열쇠',
                                  value: value.luckyKey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ),
                  ),
                    ],
                  ),
                  if (list != null) ...[
                    Positioned(
                      left: -90,
                      bottom: -15,
                      child: Builder(
                        builder: (_) {
                          final prevRank = value.rank == 1 ? 12 : value.rank - 1;
                          final prev = list[prevRank - 1];
                          return RankNavButton(
                            rank: prevRank,
                            zodiac: prev.zodiac,
                            isPrev: true,
                            onTap: () => context.pushReplacement(
                              '/main/detail',
                              extra: (prev.fortuneId, false),
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      right: -90,
                      bottom: -15,
                      child: Builder(
                        builder: (_) {
                          final nextRank = value.rank == 12 ? 1 : value.rank + 1;
                          final next = list[nextRank - 1];
                          return RankNavButton(
                            rank: nextRank,
                            zodiac: next.zodiac,
                            isPrev: false,
                            onTap: () => context.pushReplacement(
                              '/main/detail',
                              extra: (next.fortuneId, false),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
