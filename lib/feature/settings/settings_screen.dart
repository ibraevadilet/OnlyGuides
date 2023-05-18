import 'package:flutter/material.dart';
import 'package:only_guides/utils/check_premium.dart';
import 'package:only_guides/utils/check_restore.dart';
import 'package:only_guides/core/app_colors.dart';
import 'package:only_guides/core/app_images.dart';
import 'package:only_guides/core/app_text_styles.dart';
import 'package:only_guides/feature/auth/premium_screen.dart';
import 'package:only_guides/feature/settings/widget/widget_row.dart';
import 'package:only_guides/web_view_screen.dart';
import 'package:only_guides/widgets/spaces.dart';

import '../../main.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Text(
                "Settings",
                style: AppTextStyles.s19W700(color: AppColors.color008BCEBlue2),
              ),
              const SizedBox(height: 24),
              FutureBuilder(
                  future: CheckPremium.getSubscription(),
                  builder: (context, AsyncSnapshot<bool?> snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!) {
                        return SizedBox();
                      }
                    }
                    return Container(
                      padding: const EdgeInsets.all(12),
                      height: 140,
                      width: getWidth(context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.color00ADEFBlue1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 12),
                          InkWell(
                            onTap: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PremiumScreen(
                                    isPop: true,
                                  ),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                const SizedBox(width: 12),
                                Image.asset(
                                  AppImages.crownIconBlue,
                                  width: 20,
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  "Pro version \$0,99",
                                  style: AppTextStyles.s15W400(
                                      color: AppColors.color008BCEBlue2),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.chevron_right,
                                  color: AppColors.color008BCEBlue2,
                                ),
                                const SizedBox(width: 12),
                              ],
                            ),
                          ),
                          const Divider(
                            color: AppColors.color008BCEBlue2,
                          ),
                          const SizedBox(height: 12),
                          WidgetRow(
                            onTap: () => CheckRestore.checkRestore(context),
                            icon: AppImages.restoryIcon,
                            text: "Restore purchases",
                          )
                        ],
                      ),
                    );
                  }),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(12),
                height: 240,
                width: getWidth(context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.color00ADEFBlue1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 12),
                    WidgetRow(
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
                      icon: AppImages.privacyIcon,
                      text: "Privacy policy",
                    ),
                    const SizedBox(height: 12),
                    WidgetRow(
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
                      icon: AppImages.termsIcon,
                      text: "Terms of use",
                    ),
                    const SizedBox(height: 12),
                    WidgetRow(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WebViewScreen(
                              url: AppLinks.supportForm,
                              title: "Support",
                            ),
                          ),
                        );
                      },
                      icon: AppImages.supportIcon,
                      text: "Support",
                    ),
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
