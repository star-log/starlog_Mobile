import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starlog_mobile/core/constants/color.dart';
import 'package:starlog_mobile/core/constants/text_style.dart';

class CustomAsyncValue<T> extends StatelessWidget {
  final AsyncValue<T> value;
  final Widget Function(T) data;

  const CustomAsyncValue({super.key, required this.value, required this.data});

  @override
  Widget build(BuildContext context) {
    return switch (value) {
      AsyncData(:final value) => data(value),
      AsyncLoading() => Center(
        child: CircularProgressIndicator(color: StarlogColor.white),
      ),
      AsyncError(:final error) => Center(
        child: Text(
          '$error',
          style: StarlogTextStyle.body2.copyWith(color: StarlogColor.white),
        ),
      ),
    };
  }
}
