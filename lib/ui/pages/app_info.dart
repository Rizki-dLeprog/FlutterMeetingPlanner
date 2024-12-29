import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../widgets/app_bar/custom_appbar.dart';
import '../widgets/setting_group/theme.dart';
import 'profile_dev.dart';

class AppInfoPage extends StatefulWidget {
  const AppInfoPage({super.key});

  @override
  State createState() => _AppInfoPageState();
}

class _AppInfoPageState extends State<AppInfoPage> {
  int _tapCount = 0;

  void _handleVersionTap() {
    setState(() {
      _tapCount++;
    });
    print('Tap count: $_tapCount');

    if (_tapCount >= 20 && _tapCount < 25) {
      int remainingTaps = 25 - _tapCount;
      _showToast('$remainingTaps more taps to go!');
    }

    if (_tapCount == 25) {
      print('Launching URL');
      Get.to(const ProfileDev());
    }
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: white,
      textColor: primaryClr1,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomAppBar(title: 'App Info'),
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'BTS Meeting Planner',
                    style: customAppBar,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: _handleVersionTap,
                    child: Text(
                      'Version 1.0.0',
                      style: customTextHome2.copyWith(
                          color: darkGreyClr.withOpacity(0.5)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: darkGreyClr.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 4),
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/app_icon.png',
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 26),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.copyright,
                        size: 16,
                        color: darkGreyClr.withOpacity(0.5),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '2024 PT. Bangun Tjipta Sarana',
                        style: customTextHome2.copyWith(
                            color: darkGreyClr.withOpacity(0.5)),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
