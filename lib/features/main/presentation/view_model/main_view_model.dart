import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starlog_mobile/core/enums/zodiac.dart';

final mainViewModelProvider =
    AsyncNotifierProvider<MainViewModel, List<Zodiac>>(() => MainViewModel());

class MainViewModel extends AsyncNotifier<List<Zodiac>> {
  @override
  FutureOr<List<Zodiac>> build() {
    return [
      Zodiac.gemini,
      Zodiac.aquarius,
      Zodiac.libra,
      Zodiac.aries,
      Zodiac.taurus,
      Zodiac.cancer,
      Zodiac.leo,
      Zodiac.scorpio,
      Zodiac.sagittarius,
      Zodiac.capricorn,
      Zodiac.pisces,
      Zodiac.virgo,
    ];
  }
}
