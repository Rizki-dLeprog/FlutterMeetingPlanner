import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/gradients/gradient_button.dart';
import '../widgets/gradients/gradient_text.dart';
import '../widgets/other_components/bubble_text.dart';
import '../widgets/setting_group/size_config.dart';
import '../widgets/setting_group/theme.dart';
import 'home_page.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double responsiveWidth =
              constraints.maxWidth > 500 ? 500 : constraints.maxWidth;

          return Column(
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/images/bg_getStarted.png',
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [white.withOpacity(0.02), white],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: white,
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const BubbleText(
                          text: 'Bangun Tjipta Sarana',
                          colorLabel: primaryClr1,
                        ),
                        const SizedBox(height: 6),
                        SizedBox(
                          width: responsiveWidth * 0.8,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: GradientText(
                              text: 'Meeting Planner',
                              style: getStarted,
                              gradientColors: gradientClr2,
                            ),
                          ),
                        ),
                        const Spacer(),
                        GradientButton(
                          text: 'Get Started',
                          gradientColors: gradientClr3,
                          onPressed: () => _onGetStartedPressed(context),
                          width: responsiveWidth * 0.85,
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _onGetStartedPressed(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasStarted', true);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }
}
