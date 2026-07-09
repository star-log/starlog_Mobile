import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starlog_mobile/core/enums/zodiac.dart';
import 'package:starlog_mobile/features/fortune/data/model/fortune_model.dart';

final mainViewModelProvider =
    AsyncNotifierProvider<MainViewModel, List<FortuneModel>>(
      () => MainViewModel(),
    );

class MainViewModel extends AsyncNotifier<List<FortuneModel>> {
  @override
  FutureOr<List<FortuneModel>> build() {
    return [
      FortuneModel(fortuneId: 1, zodiac: Zodiac.gemini),
      FortuneModel(fortuneId: 2, zodiac: Zodiac.aquarius),
      FortuneModel(fortuneId: 3, zodiac: Zodiac.libra),
      FortuneModel(fortuneId: 4, zodiac: Zodiac.aries),
      FortuneModel(fortuneId: 5, zodiac: Zodiac.taurus),
      FortuneModel(fortuneId: 6, zodiac: Zodiac.cancer),
      FortuneModel(fortuneId: 7, zodiac: Zodiac.leo),
      FortuneModel(fortuneId: 8, zodiac: Zodiac.scorpio),
      FortuneModel(fortuneId: 9, zodiac: Zodiac.sagittarius),
      FortuneModel(fortuneId: 10, zodiac: Zodiac.capricorn),
      FortuneModel(fortuneId: 11, zodiac: Zodiac.pisces),
      FortuneModel(fortuneId: 12, zodiac: Zodiac.virgo)
    ];
  }
}
