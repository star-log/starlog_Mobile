import 'package:flowbite_icons/flowbite_icons.dart';
import 'package:flutter/material.dart';
import 'package:starlog_mobile/core/constants/color.dart';

class StarRating extends StatelessWidget {
  final int count;
  final double size;

  const StarRating({
    super.key,
    required this.count,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        count,
            (_) => Icon(FlowbiteSolidIcons.star, size: size, color: StarlogColor.star),
      ),
    );
  }
}