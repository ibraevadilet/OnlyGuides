import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:only_guides/core/app_colors.dart';
import 'package:only_guides/core/app_images.dart';
import 'package:only_guides/core/app_text_styles.dart';
import 'package:only_guides/widgets/spaces.dart';
import 'package:shimmer/shimmer.dart';

class DetailAuthorScreen extends StatelessWidget {
  const DetailAuthorScreen({Key? key}) : super(key: key);

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
                Text(
                  "Instagram design example",
                  style:
                      AppTextStyles.s19W700(color: AppColors.color008BCEBlue2),
                )
              ],
            ),
            const SizedBox(height: 20),
            CachedNetworkImage(
              imageUrl: "https://autodmir.ru/logo/1/2312/photo.jpg",
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
                      image: NetworkImage(
                          "https://autodmir.ru/logo/1/2312/photo.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Text(
              "Lorem ipsum dolor sit amet,",
              textAlign: TextAlign.start,
              style: AppTextStyles.s19W400(color: Colors.black),
            )
          ],
        ),
      )),
    );
  }
}
