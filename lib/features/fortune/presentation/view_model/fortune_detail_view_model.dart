import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starlog_mobile/core/enums/fortune_color.dart';
import 'package:starlog_mobile/core/enums/zodiac.dart';
import 'package:starlog_mobile/features/fortune/data/model/fortune_detail_model.dart';

final fortuneDetailViewModelProvider =
    AsyncNotifierProvider.family<
      FortuneDetailViewModel,
      FortuneDetailModel,
      int
    >(FortuneDetailViewModel.new);

class FortuneDetailViewModel extends AsyncNotifier<FortuneDetailModel> {
  FortuneDetailViewModel(this.fortuneId);

  final int fortuneId;

  @override
  FutureOr<FortuneDetailModel> build() {
    return _dummyList.firstWhere(
      (e) => e.fortuneId == fortuneId,
      orElse: () => throw StateError('운세 정보를 찾을 수 없어요. (id: $fortuneId)'),
    );
  }
}

final _dummyList = [
  FortuneDetailModel(
    fortuneId: 1,
    zodiac: Zodiac.gemini,
    moneyScore: 1,
    loveScore: 5,
    workScore: 5,
    healthScore: 4,
    luckyColor: FortuneColor.orange,
    luckyKey: '심리 테스트',
    rank: 1,
    description: '피로가 쌓이면서 몸 상태가 조금씩 떨어지는 기운이에요.\n평소보다 무리하지 말고 몸을 아끼며 지내는 게 좋겠습니다.\n싼 가격에 끌려서 한 구매는 예상보다 큰 지출로 이어질 수도 있어요.',
  ),
  FortuneDetailModel(
    fortuneId: 2,
    zodiac: Zodiac.aquarius,
    moneyScore: 4,
    loveScore: 4,
    workScore: 3,
    healthScore: 5,
    luckyColor: FortuneColor.blue,
    luckyKey: '산책',
    rank: 2,
    description: '피로가 쌓이면서 몸 상태가 조금씩 떨어지는 기운이에요.\n평소보다 무리하지 말고 몸을 아끼며 지내는 게 좋겠습니다.\n싼 가격에 끌려서 한 구매는 예상보다 큰 지출로 이어질 수도 있어요.',
  ),
  FortuneDetailModel(
    fortuneId: 3,
    zodiac: Zodiac.libra,
    moneyScore: 4,
    loveScore: 3,
    workScore: 4,
    healthScore: 4,
    luckyColor: FortuneColor.pink,
    luckyKey: '독서',
    rank: 3,
    description: '피로가 쌓이면서 몸 상태가 조금씩 떨어지는 기운이에요.\n평소보다 무리하지 말고 몸을 아끼며 지내는 게 좋겠습니다.\n싼 가격에 끌려서 한 구매는 예상보다 큰 지출로 이어질 수도 있어요.',
  ),
  FortuneDetailModel(
    fortuneId: 4,
    zodiac: Zodiac.aries,
    moneyScore: 3,
    loveScore: 3,
    workScore: 3,
    healthScore: 3,
    luckyColor: FortuneColor.red,
    luckyKey: '운동',
    rank: 4,
    description: '피로가 쌓이면서 몸 상태가 조금씩 떨어지는 기운이에요.\n평소보다 무리하지 말고 몸을 아끼며 지내는 게 좋겠습니다.\n싼 가격에 끌려서 한 구매는 예상보다 큰 지출로 이어질 수도 있어요.',
  ),
  FortuneDetailModel(
    fortuneId: 5,
    zodiac: Zodiac.taurus,
    moneyScore: 3,
    loveScore: 2,
    workScore: 4,
    healthScore: 3,
    luckyColor: FortuneColor.green,
    luckyKey: '요리',
    rank: 5,
    description: '피로가 쌓이면서 몸 상태가 조금씩 떨어지는 기운이에요.\n평소보다 무리하지 말고 몸을 아끼며 지내는 게 좋겠습니다.\n싼 가격에 끌려서 한 구매는 예상보다 큰 지출로 이어질 수도 있어요.',
  ),
  FortuneDetailModel(
    fortuneId: 6,
    zodiac: Zodiac.cancer,
    moneyScore: 3,
    loveScore: 4,
    workScore: 2,
    healthScore: 3,
    luckyColor: FortuneColor.mint,
    luckyKey: '음악 감상',
    rank: 6,
    description: '피로가 쌓이면서 몸 상태가 조금씩 떨어지는 기운이에요.\n평소보다 무리하지 말고 몸을 아끼며 지내는 게 좋겠습니다.\n싼 가격에 끌려서 한 구매는 예상보다 큰 지출로 이어질 수도 있어요.',
  ),
  FortuneDetailModel(
    fortuneId: 7,
    zodiac: Zodiac.leo,
    moneyScore: 3,
    loveScore: 3,
    workScore: 3,
    healthScore: 2,
    luckyColor: FortuneColor.yellow,
    luckyKey: '영화',
    rank: 7,
    description: '피로가 쌓이면서 몸 상태가 조금씩 떨어지는 기운이에요.\n평소보다 무리하지 말고 몸을 아끼며 지내는 게 좋겠습니다.\n싼 가격에 끌려서 한 구매는 예상보다 큰 지출로 이어질 수도 있어요.',
  ),
  FortuneDetailModel(
    fortuneId: 8,
    zodiac: Zodiac.scorpio,
    moneyScore: 2,
    loveScore: 3,
    workScore: 2,
    healthScore: 3,
    luckyColor: FortuneColor.grey,
    luckyKey: '명상',
    rank: 8,
    description: '피로가 쌓이면서 몸 상태가 조금씩 떨어지는 기운이에요.\n평소보다 무리하지 말고 몸을 아끼며 지내는 게 좋겠습니다.\n싼 가격에 끌려서 한 구매는 예상보다 큰 지출로 이어질 수도 있어요.',
  ),
  FortuneDetailModel(
    fortuneId: 9,
    zodiac: Zodiac.sagittarius,
    moneyScore: 2,
    loveScore: 2,
    workScore: 3,
    healthScore: 2,
    luckyColor: FortuneColor.black,
    luckyKey: '여행 계획',
    rank: 9,
    description: '피로가 쌓이면서 몸 상태가 조금씩 떨어지는 기운이에요.\n평소보다 무리하지 말고 몸을 아끼며 지내는 게 좋겠습니다.\n싼 가격에 끌려서 한 구매는 예상보다 큰 지출로 이어질 수도 있어요.',
  ),
  FortuneDetailModel(
    fortuneId: 10,
    zodiac: Zodiac.capricorn,
    moneyScore: 2,
    loveScore: 2,
    workScore: 2,
    healthScore: 3,
    luckyColor: FortuneColor.brown,
    luckyKey: '정리 정돈',
    rank: 10,
    description: '피로가 쌓이면서 몸 상태가 조금씩 떨어지는 기운이에요.\n평소보다 무리하지 말고 몸을 아끼며 지내는 게 좋겠습니다.\n싼 가격에 끌려서 한 구매는 예상보다 큰 지출로 이어질 수도 있어요.',
  ),
  FortuneDetailModel(
    fortuneId: 11,
    zodiac: Zodiac.pisces,
    moneyScore: 2,
    loveScore: 3,
    workScore: 1,
    healthScore: 2,
    luckyColor: FortuneColor.navy,
    luckyKey: '그림 그리기',
    rank: 11,
    description: '피로가 쌓이면서 몸 상태가 조금씩 떨어지는 기운이에요.\n평소보다 무리하지 말고 몸을 아끼며 지내는 게 좋겠습니다.\n싼 가격에 끌려서 한 구매는 예상보다 큰 지출로 이어질 수도 있어요.',
  ),
  FortuneDetailModel(
    fortuneId: 12,
    zodiac: Zodiac.virgo,
    moneyScore: 1,
    loveScore: 1,
    workScore: 2,
    healthScore: 2,
    luckyColor: FortuneColor.yellowGreen,
    luckyKey: '일기 쓰기',
    rank: 12,
    description: '피로가 쌓이면서 몸 상태가 조금씩 떨어지는 기운이에요.\n평소보다 무리하지 말고 몸을 아끼며 지내는 게 좋겠습니다.\n싼 가격에 끌려서 한 구매는 예상보다 큰 지출로 이어질 수도 있어요.',
  ),
];
