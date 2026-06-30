import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starlog_mobile/core/enums/zodiac.dart';

final myZodiacProvider = FutureProvider<Zodiac>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  final birthday = prefs.getString('birthday');
  if (birthday == null) throw StateError('생일 정보가 없습니다.');
  final parts = birthday.split('.');
  return ZodiacExtension.fromBirthday(int.parse(parts[1]), int.parse(parts[2]));
});