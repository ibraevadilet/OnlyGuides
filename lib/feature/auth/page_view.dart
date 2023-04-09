import 'package:flutter/material.dart';
import 'package:only_guides/core/app_colors.dart';
import 'package:only_guides/core/app_text_styles.dart';

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({
    super.key,
    required this.title,
    required this.text,
    required this.image,
  });
  final String title;
  final String text;

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
          Text(
            title,
            style: AppTextStyles.s32W800(
              color: AppColors.color008BCEBlue2,
            ),
          ),
          const SizedBox(height: 80),
          Container(
            height: 285,
            child: Center(
              child: Image.asset(image),
            ),
          ),
          const SizedBox(height: 70),
          Text(
            text,
            textAlign: TextAlign.center,
            style: AppTextStyles.s19W400(
              color: AppColors.color008BCEBlue2,
            ),
          ),
        ],
      ),
    );
  }
}
