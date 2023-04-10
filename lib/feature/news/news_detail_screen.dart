import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:only_guides/core/app_colors.dart';
import 'package:only_guides/core/app_images.dart';
import 'package:only_guides/core/app_text_styles.dart';
import 'package:only_guides/logic/models/news_model.dart';
import 'package:only_guides/widgets/spaces.dart';
import 'package:shimmer/shimmer.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({Key? key, required this.model}) : super(key: key);
  final NewsModel model;

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
                  imageUrl: model.image,
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
                    return Stack(
                      children: [
                        Container(
                          width: getWidth(context),
                          height: 500,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(model.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 24,
                          top: 24,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xffABE8FF),
                                  Color(0xff1E91EE),
                                ],
                              ),
                            ),
                            child: Text(
                              model.newsType,
                              style: AppTextStyles.s15W400(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    model.description,
                    textAlign: TextAlign.start,
                    style: AppTextStyles.s19W400(color: Colors.black),
                  ),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
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
                  model.title,
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
