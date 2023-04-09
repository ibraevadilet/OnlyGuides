import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:only_guides/core/app_colors.dart';
import 'package:only_guides/core/app_images.dart';
import 'package:only_guides/core/app_text_styles.dart';
import 'package:only_guides/widgets/spaces.dart';
import 'package:shimmer/shimmer.dart';

class DetailHomeScreen extends StatelessWidget {
  const DetailHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 92),
                CachedNetworkImage(
                  imageUrl: "https://autodmir.ru/logo/1/2312/photo.jpg",
                  placeholder: (_, url) {
                    return SizedBox(
                      width: getWidth(context),
                      height: 500,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.4),
                        highlightColor: Colors.white,
                        child: Container(
                          color: Colors.grey,
                        ),
                      ),
                    );
                  },
                  imageBuilder: (_, imageProvider) {
                    return Container(
                      width: getWidth(context),
                      height: 500,
                      decoration: BoxDecoration(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "Lorem ipsum dolor sit amet,",
                    textAlign: TextAlign.start,
                    style: AppTextStyles.s19W400(color: Colors.black),
                  ),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            height: 104,
            width: getWidth(context),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
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
          ),
        ],
      ),
    );
  }
}
