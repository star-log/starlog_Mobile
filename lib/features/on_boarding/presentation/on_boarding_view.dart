import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starlog_mobile/core/constants/color.dart';
import 'package:starlog_mobile/core/constants/text_style.dart';
import 'package:starlog_mobile/features/on_boarding/presentation/widget/button.dart';
import 'package:starlog_mobile/features/on_boarding/presentation/widget/default_modal.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  static final DateTime _minimumDate = DateTime(1900);
  static final DateTime _maximumDate = DateTime.now();
  static final DateTime _defaultDate = DateTime.now();

  late DateTime _currentDate;

  @override
  void initState() {
    super.initState();
    _currentDate = _defaultDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: LuckyColor.workBorder, width: 4),
                  borderRadius: BorderRadius.circular(12),
                  color: StarlogColor.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('환영해요!', style: StarlogTextStyle.subTitle2),
                          Text('생년월일을 설정해주세요.', style: StarlogTextStyle.body3),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: StarlogColor.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: CupertinoDatePicker(
                        onDateTimeChanged: (value) {
                          setState(() {
                            _currentDate = value;
                          });
                        },
                        mode: CupertinoDatePickerMode.date,
                        minimumDate: _minimumDate,
                        maximumDate: _maximumDate,
                        initialDateTime: _currentDate,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: StarlogButton(
                        color: LuckyColor.work,
                        onTap: () async {
                          final formatted = '${_currentDate.year}년 ${_currentDate.month}월 ${_currentDate.day}일';
                          await showDialog(
                              context: context,
                              builder: (_) => StarlogModal(
                                  title: '생일이\n$formatted이 맞나요?',
                                  description: '나중에 변경 가능해요.',
                                  leftMessage: '아니요',
                                  rightMessage: '네',
                                  onLeftPressed: () => context.pop(),
                                  onRightPressed: () async {
                                    final prefs = await SharedPreferences.getInstance();
                                    prefs.setString('birthday', '${_currentDate.year}.${_currentDate.month}.${_currentDate.day}');
                                    context.pop();
                                    context.go('/main');
                                  }
                              )
                          );
                        },
                        icon: Icons.check,
                        borderRadius: 100,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
