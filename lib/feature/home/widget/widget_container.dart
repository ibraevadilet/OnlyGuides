import 'package:flutter/material.dart';
import 'package:only_guides/core/app_images.dart';
import 'package:only_guides/core/app_text_styles.dart';
import 'package:only_guides/feature/home/detai_home_screen.dart';
import 'package:only_guides/widgets/spaces.dart';

class WidgetConatiner extends StatelessWidget {
  const WidgetConatiner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailHomeScreen(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(24),
        width: getWidth(context),
        height: 254,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xffABE8FF),
              Color(0xff1E91EE),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          image: const DecorationImage(
            image: AssetImage(AppImages.bgcontainer),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Instagram",
              style: AppTextStyles.s15W700(color: Colors.white),
            ),
            const Spacer(),
            Text(
              "How to manage instagram",
              style: AppTextStyles.s19W700(color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              "How to manage instagram\nHow to manage instagram",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.s15W700(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
