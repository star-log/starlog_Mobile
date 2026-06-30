import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:starlog_mobile/core/constants/color.dart';

class StarlogBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const StarlogBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: StarlogColor.white,
        boxShadow: [
          BoxShadow(
            color: StarlogColor.black.withValues(alpha: 0.08),
            offset: Offset(0, -4),
            blurRadius: 12.0,
          )
        ]
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => onTap(0),
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Symbols.home_rounded, size: 36, fill: 1),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}