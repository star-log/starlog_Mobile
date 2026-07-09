import 'package:starlog_mobile/core/enums/fortune_color.dart';
import 'package:starlog_mobile/core/enums/zodiac.dart';

class FortuneDetailModel {
  final int fortuneId;
  final int rank;
  final Zodiac zodiac;
  final String description;
  final int moneyScore;
  final int loveScore;
  final int workScore;
  final int healthScore;

  final FortuneColor luckyColor;
  final String luckyKey;

  FortuneDetailModel({
    required this.fortuneId,
    required this.rank,
    required this.zodiac,
    required this.description,
    required this.moneyScore,
    required this.loveScore,
    required this.workScore,
    required this.healthScore,
    required this.luckyColor,
    required this.luckyKey,
  });
}
