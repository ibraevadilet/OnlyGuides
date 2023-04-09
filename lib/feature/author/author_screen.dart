import 'package:flutter/material.dart';
import 'package:only_guides/core/app_colors.dart';
import 'package:only_guides/core/app_text_styles.dart';
import 'package:only_guides/feature/author/widget/widget_container.dart';

class AuthorScreen extends StatelessWidget {
  const AuthorScreen({Key? key}) : super(key: key);

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
                "Presets",
                style: AppTextStyles.s19W700(color: AppColors.color008BCEBlue2),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => WidgetContainer(),
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
