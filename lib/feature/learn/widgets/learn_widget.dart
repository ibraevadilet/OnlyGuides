import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:only_guides/config/check_premium.dart';
import 'package:only_guides/core/app_colors.dart';
import 'package:only_guides/core/app_text_styles.dart';
import 'package:only_guides/logic/models/learn_model.dart';
import 'package:shimmer/shimmer.dart';

class LearnWidget extends StatelessWidget {
  const LearnWidget({super.key, required this.model});
  final LearnModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CachedNetworkImage(
          imageUrl: model.image,
          placeholder: (_, url) {
            return SizedBox(
              width: 88,
              height: 88,
              child: Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.4),
                highlightColor: Colors.white,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            );
          },
          imageBuilder: (_, imageProvider) {
            return Stack(
              children: [
                Container(
                  width: 88,
                  height: 88,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: NetworkImage(model.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                FutureBuilder(
                  future: CheckPremium.getSubscription(),
                  builder: (context, AsyncSnapshot<bool?> snapshot) {
                    if (snapshot.hasData) {
                      if (!snapshot.data! && model.isPro) {
                        return Container(
                          width: 88,
                          height: 88,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.black.withOpacity(0.5),
                          ),
                          child: const Icon(
                            Icons.lock,
                            color: Colors.white,
                            size: 30,
                          ),
                        );
                      }
                    }
                    return const SizedBox();
                  },
                ),
              ],
            );
          },
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.title,
              style: AppTextStyles.s19W700(
                color: AppColors.color008BCEBlue2,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              model.time,
              style: AppTextStyles.s13W700(
                color: AppColors.color008BCEBlue2,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              model.description,
              style: AppTextStyles.s13W400(
                color: AppColors.color008BCEBlue2,
              ),
            ),
          ],
        )
      ],
    );
  }
}
