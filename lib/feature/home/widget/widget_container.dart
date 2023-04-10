import 'package:flutter/material.dart';
import 'package:only_guides/config/check_premium.dart';
import 'package:only_guides/core/app_images.dart';
import 'package:only_guides/core/app_text_styles.dart';
import 'package:only_guides/feature/auth/premium_screen.dart';
import 'package:only_guides/feature/home/detai_home_screen.dart';
import 'package:only_guides/logic/models/guide_model.dart';
import 'package:only_guides/widgets/spaces.dart';

class WidgetConatiner extends StatelessWidget {
  const WidgetConatiner({Key? key, required this.model}) : super(key: key);
  final GuideModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final isBuy = await CheckPremium.getSubscription();
        if (!isBuy && model.isPro) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PremiumScreen(
                isPop: true,
              ),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailHomeScreen(
                model: model,
              ),
            ),
          );
        }
      },
      child: Stack(
        children: [
          Container(
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
                  model.socialType,
                  style: AppTextStyles.s15W700(color: Colors.white),
                ),
                const Spacer(),
                Text(
                  model.title,
                  style: AppTextStyles.s19W700(color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  model.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.s15W700(color: Colors.white),
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: CheckPremium.getSubscription(),
            builder: (context, AsyncSnapshot<bool?> snapshot) {
              if (snapshot.hasData) {
                if (!snapshot.data! && model.isPro) {
                  return Container(
                    padding: const EdgeInsets.all(24),
                    width: getWidth(context),
                    height: 254,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xff262626).withOpacity(0.5),
                          const Color(0xff262626).withOpacity(0.5),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                        image: AssetImage(AppImages.bgcontainer),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: const Icon(
                      Icons.lock,
                      color: Colors.white,
                      size: 50,
                    ),
                  );
                }
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
