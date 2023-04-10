import 'package:flutter/material.dart';
import 'package:only_guides/config/check_premium.dart';

import 'package:only_guides/core/app_images.dart';
import 'package:only_guides/feature/auth/page_view.dart';
import 'package:only_guides/feature/auth/premium_screen.dart';
import 'package:only_guides/widgets/buttom_navigator.dart';
import 'package:only_guides/widgets/custom_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController controller = PageController();
  int currantPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (value) {
                setState(() {
                  currantPage = value;
                });
              },
              controller: controller,
              children: const [
                PageViewWidget(
                  title: "Guide",
                  image: AppImages.pageView1,
                  text:
                      'read the instructions and recommendations to achieve your specific goal',
                ),
                PageViewWidget(
                  title: "News",
                  image: AppImages.pageView2,
                  text:
                      'we will provide you with access to the latest and most interesting news from around the world',
                ),
                PageViewWidget(
                  title: "Education",
                  image: AppImages.pageView3,
                  text:
                      'study our educational material and gain new knowledge and skills that will help you reach new heights',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: CustomButton(
              height: 45,
              text: 'Continue',
              onPressed: () async {
                final isBuy = await CheckPremium.getSubscription();
                if (currantPage == 2) {
                  if (!isBuy) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PremiumScreen(),
                      ),
                      (protected) => false,
                    );
                  } else {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BottomNavigatorScreen(),
                      ),
                      (protected) => false,
                    );
                  }
                } else {
                  controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                }
              },
            ),
          ),
          const SizedBox(height: 90),
        ],
      ),
    );
  }
}
