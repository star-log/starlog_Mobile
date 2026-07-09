import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:ming_cute_icons/ming_cute_icons.dart';
import 'package:starlog_mobile/core/constants/app_assets.dart';
import 'package:starlog_mobile/core/constants/color.dart';
import 'package:starlog_mobile/core/constants/text_style.dart';
import 'package:starlog_mobile/core/widgets/custom_async_value.dart';
import 'package:starlog_mobile/features/fortune/presentation/view_model/fortune_view_model.dart';
import 'package:starlog_mobile/features/fortune/presentation/view_model/my_zodiac_view_model.dart';
import 'package:starlog_mobile/features/fortune/presentation/widget/ranking_item.dart';

class StarlogMain extends ConsumerWidget {
  const StarlogMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String now = DateFormat('M월 d일').format(DateTime.now());
    final myZodiac = ref.watch(myZodiacProvider).value;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
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
                            text: '오늘의 별자리 순위 ',
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
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      // TODO: 설정 페이지로 이동
                    },
                    child: Icon(
                      MingCuteIcons.mgc_settings_3_fill,
                      color: StarlogColor.white,
                      size: 23,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: CustomAsyncValue(
                  value: ref.watch(mainViewModelProvider),
                  data: (value) => ListView.builder(
                    padding: EdgeInsets.only(top: value.first.zodiac == myZodiac ? 20 : 0),
                    itemCount: value.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          context.push('/main/detail', extra: (value[index].fortuneId, true));
                        },
                        child: RankingItem(
                          rank: index + 1,
                          zodiac: value[index].zodiac,
                          isMySign: myZodiac == value[index].zodiac,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
