import 'package:flutter/material.dart';
import 'package:only_guides/core/app_colors.dart';
import 'package:only_guides/core/app_images.dart';
import 'package:only_guides/core/app_text_styles.dart';
import 'package:only_guides/feature/home/widget/widget_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Guide",
                    style: AppTextStyles.s19W700(
                        color: AppColors.color008BCEBlue2),
                  ),
                  Image.asset(
                    AppImages.fireIcon,
                    width: 20,
                  )
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => WidgetConatiner(),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemCount: 6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
