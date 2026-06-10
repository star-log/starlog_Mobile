import 'package:flutter/material.dart';
import 'package:starlog_mobile/core/constants/color.dart';

abstract final class StarlogTextStyle {
  static TextStyle title1 = defaultTextStyle.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.w900,
  );

  static TextStyle subTitle1 = defaultTextStyle.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w900,
  );

  static TextStyle subTitle2 = defaultTextStyle.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static TextStyle body1 = defaultTextStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static TextStyle body2 = defaultTextStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static TextStyle body3 = defaultTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static TextStyle splash = defaultTextStyle.copyWith(
    fontSize: 26,
    fontFamily: 'MaruBuri',
    fontWeight: FontWeight.w400,
  );
}

const TextStyle defaultTextStyle = TextStyle(
  fontFamily: 'Pretendard',
  color: StarlogColor.white,
);
