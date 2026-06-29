import 'package:flutter/material.dart';
import 'package:ming_cute_icons/ming_cute_icons.dart';

enum Zodiac {
  gemini,
  aquarius,
  libra,
  aries,
  taurus,
  cancer,
  leo,
  scorpio,
  sagittarius,
  capricorn,
  pisces,
  virgo,
}

extension ZodiacExtension on Zodiac {
  String get label =>
      switch (this) {
        Zodiac.gemini => '쌍둥이자리',
        Zodiac.aquarius => '물병자리',
        Zodiac.libra => '천칭자리',
        Zodiac.aries => '양자리',
        Zodiac.taurus => '황소자리',
        Zodiac.cancer => '게자리',
        Zodiac.leo => '사자자리',
        Zodiac.scorpio => '전갈자리',
        Zodiac.sagittarius => '사수자리',
        Zodiac.capricorn => '염소자리',
        Zodiac.pisces => '물고기자리',
        Zodiac.virgo => '처녀자리'
      };

  String get dateRange =>
      switch (this) {
        Zodiac.gemini => '5/21 ~ 6/21',
        Zodiac.aquarius => '1/20 ~ 2/18',
        Zodiac.libra => '9/24 ~ 10/22',
        Zodiac.aries => '3/21 ~ 4/19',
        Zodiac.taurus => '4/20 ~ 5/20',
        Zodiac.cancer => '6/22 ~ 7/22',
        Zodiac.leo => '7/23 ~ 8/22',
        Zodiac.scorpio => '10/23 ~ 11/22',
        Zodiac.sagittarius => '11/23 ~ 12/24',
        Zodiac.capricorn => '12/25 ~ 1/19',
        Zodiac.pisces => '2/19 ~ 3/20',
        Zodiac.virgo => '8/23 ~ 9/23'
      };

  IconData get icon =>
      switch (this) {
        Zodiac.gemini => MingCuteIcons.mgc_Gemini_fill,
        Zodiac.aquarius => MingCuteIcons.mgc_Aquarius_fill,
        Zodiac.libra => MingCuteIcons.mgc_Libra_fill,
        Zodiac.aries => MingCuteIcons.mgc_Aries_fill,
        Zodiac.taurus => MingCuteIcons.mgc_Taurus_fill,
        Zodiac.cancer => MingCuteIcons.mgc_Cancer_fill,
        Zodiac.leo => MingCuteIcons.mgc_Leo_fill,
        Zodiac.scorpio => MingCuteIcons.mgc_Scorpio_fill,
        Zodiac.sagittarius => MingCuteIcons.mgc_Sagittarius_fill,
        Zodiac.capricorn => MingCuteIcons.mgc_Capricorn_fill,
        Zodiac.pisces => MingCuteIcons.mgc_Pisces_fill,
        Zodiac.virgo => MingCuteIcons.mgc_Virgo_fill
      };

  Color get color =>
      switch (this) {
        Zodiac.gemini => Color(0xFFFFCF99),
        Zodiac.aquarius => Color(0xFF99C5FF),
        Zodiac.libra => Color(0xFFFFAF99),
        Zodiac.aries => Color(0xFFD3C4AA),
        Zodiac.taurus => Color(0xFFFFBE56),
        Zodiac.cancer => Color(0xFFFF89C6),
        Zodiac.leo => Color(0xFFFFB16E),
        Zodiac.scorpio => Color(0xFFCB8CFF),
        Zodiac.sagittarius => Color(0xFF97F0EC),
        Zodiac.capricorn => Color(0xFFACE5B4),
        Zodiac.pisces => Color(0xFF83DCFF),
        Zodiac.virgo => Color(0xFFFFB3DD)
      };
}
