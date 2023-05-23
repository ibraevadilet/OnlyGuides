import 'package:apphud/apphud.dart';
import 'package:flutter/material.dart';
import 'package:only_guides/utils/check_premium.dart';
import 'package:only_guides/core/app_colors.dart';
import 'package:only_guides/core/app_images.dart';
import 'package:only_guides/core/app_text_styles.dart';
import 'package:only_guides/utils/check_restore.dart';
import 'package:only_guides/web_view_screen.dart';
import 'package:only_guides/widgets/buttom_navigator.dart';
import 'package:only_guides/widgets/custom_button.dart';

import '../../main.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key, this.isPop = false});
  final bool isPop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "PRO\nVERSION",
                    style: AppTextStyles.s32W800(
                      color: AppColors.color008BCEBlue2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Image.asset(
                AppImages.premiumImage,
                height: 285,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.crownIconBlue,
                    width: 20,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "More guides",
                    style: AppTextStyles.s18W700(
                        color: AppColors.color008BCEBlue2),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.crownIconBlue,
                    width: 20,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "More learning material",
                    style: AppTextStyles.s18W700(
                        color: AppColors.color008BCEBlue2),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.crownIconBlue,
                    width: 20,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "Without advertising",
                    style: AppTextStyles.s18W700(
                        color: AppColors.color008BCEBlue2),
                  )
                ],
              ),
              const Spacer(),
              CustomButton(
                text: 'Buy Premium for \$0.99',
                onPressed: () async {
                  var paywalls = await Apphud.paywalls();
                  await Apphud.purchase(
                    product: paywalls?.paywalls.first.products!.first,
                  ).whenComplete(
                    () async {
                      if (await Apphud.hasActiveSubscription() ||
                          await Apphud.hasPremiumAccess()) {
                        await CheckPremium.setSubscription();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BottomNavigatorScreen(),
                          ),
                          (protected) => false,
                        );
                      }
                    },
                  );
                },
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WebViewScreen(
                            url: AppLinks.privacyPolicy,
                            title: "Privacy Policy",
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'Privacy Policy',
                      style: AppTextStyles.s13W400(color: AppColors.black),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      CheckRestore.checkRestore(context);
                    },
                    child: Text(
                      'Restore purchases',
                      style: AppTextStyles.s13W400(color: AppColors.black),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WebViewScreen(
                            url: AppLinks.termOfUse,
                            title: "Terms of Use",
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'Terms of Use',
                      style: AppTextStyles.s13W400(color: AppColors.black),
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
        Positioned(
          right: 20,
          top: 50,
          child: InkWell(
            onTap: () {
              if (isPop) {
                Navigator.pop(context);
              } else {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BottomNavigatorScreen(),
                  ),
                  (protected) => false,
                );
              }
            },
            child: const Icon(
              Icons.close,
              color: AppColors.color008BCEBlue2,
            ),
          ),
        ),
      ],
    ));
  }
}
