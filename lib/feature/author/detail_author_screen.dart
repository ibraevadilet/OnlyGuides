import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:only_guides/core/app_colors.dart';
import 'package:only_guides/core/app_images.dart';
import 'package:only_guides/core/app_text_styles.dart';
import 'package:only_guides/logic/models/preset_model.dart';
import 'package:only_guides/widgets/spaces.dart';
import 'package:shimmer/shimmer.dart';

class DetailAuthorScreen extends StatelessWidget {
  const DetailAuthorScreen({Key? key, required this.model}) : super(key: key);
  final PresetModel model;

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
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    AppImages.leftIcon,
                    width: 24,
                  ),
                ),
                const SizedBox(width: 25),
                Flexible(
                  child: Text(
                    model.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.s19W700(
                        color: AppColors.color008BCEBlue2),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            CachedNetworkImage(
              imageUrl: model.image,
              placeholder: (_, url) {
                return SizedBox(
                  width: getWidth(context),
                  height: 254,
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
                return Container(
                  width: getWidth(context),
                  height: 254,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: NetworkImage(model.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Text(
              model.description,
              textAlign: TextAlign.start,
              style: AppTextStyles.s19W400(color: Colors.black),
            )
          ],
        ),
      )),
    );
  }
}
