import 'dart:ui';

enum FortuneColor {
  red,
  orange,
  yellow,
  yellowGreen,
  green,
  mint,
  skyBlue,
  blue,
  navy,
  purple,
  brown,
  grey,
  black,
  pink,
}

extension FortuneColorExtension on FortuneColor {
  Color get color => switch (this) {
    FortuneColor.red => const Color(0xFFFD8D81),
    FortuneColor.orange => const Color(0xFFFFBC6F),
    FortuneColor.yellow => const Color(0xFFFFD57C),
    FortuneColor.yellowGreen => const Color(0xFFC6E584),
    FortuneColor.green => const Color(0xFF9CE28E),
    FortuneColor.mint => const Color(0xFF96E5D1),
    FortuneColor.skyBlue => const Color(0xFF9EE4FF),
    FortuneColor.blue => const Color(0xFF9ED3FF),
    FortuneColor.navy => const Color(0xFF9EABFF),
    FortuneColor.purple => const Color(0xFFB09FEA),
    FortuneColor.brown => const Color(0xFFD7B689),
    FortuneColor.grey => const Color(0xFFA2A2A2),
    FortuneColor.black => const Color(0xFF515151),
    FortuneColor.pink => const Color(0xFFFFB6B7),
  };

  String get label => switch (this) {
    FortuneColor.red => '빨강색',
    FortuneColor.orange => '주황색',
    FortuneColor.yellow => '노랑색',
    FortuneColor.yellowGreen => '연두색',
    FortuneColor.green => '초록색',
    FortuneColor.mint => '민트색',
    FortuneColor.skyBlue => '하늘색',
    FortuneColor.blue => '파랑색',
    FortuneColor.navy => '남색',
    FortuneColor.purple => '보라색',
    FortuneColor.brown => '갈색',
    FortuneColor.grey => '회색',
    FortuneColor.black => '검정색',
    FortuneColor.pink => '분홍색',
  };
}
