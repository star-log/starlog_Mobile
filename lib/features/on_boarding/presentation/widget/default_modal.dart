import 'package:flutter/material.dart';
import 'package:starlog_mobile/core/constants/color.dart';
import 'package:starlog_mobile/core/constants/text_style.dart';
import 'package:starlog_mobile/features/on_boarding/presentation/widget/button.dart';

class StarlogModal extends StatelessWidget {
  final String title;
  final String description;
  final String leftMessage;
  final String rightMessage;
  final VoidCallback onLeftPressed;
  final VoidCallback onRightPressed;

  const StarlogModal({
    super.key,
    required this.title,
    this.description = '',
    required this.leftMessage,
    required this.rightMessage,
    required this.onLeftPressed,
    required this.onRightPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: StarlogColor.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  title,
                  style: StarlogTextStyle.body1,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  description,
                  style: StarlogTextStyle.body3.copyWith(
                    color: StarlogColor.grayText,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StarlogButton(
                    text: leftMessage,
                    color: LuckyColor.key,
                    onTap: onLeftPressed,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: StarlogButton(
                      text: rightMessage,
                      color: LuckyColor.work,
                      onTap: onRightPressed,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
