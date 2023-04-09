import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:only_guides/core/app_colors.dart';
import 'package:only_guides/core/app_text_styles.dart';
import 'package:only_guides/feature/author/detail_author_screen.dart';
import 'package:only_guides/widgets/spaces.dart';

import 'package:shimmer/shimmer.dart';

class WidgetContainer extends StatelessWidget {
  const WidgetContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailAuthorScreen(),
          ),
        );
      },
      child: Container(
        width: getWidth(context),
        height: 254,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [
              Colors.transparent,
              AppColors.color008BCEBlue2,
            ],
          ),
        ),
        child: CachedNetworkImage(
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
            return Stack(
              children: [
                Container(
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
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.bottomCenter,
                  width: getWidth(context),
                  height: 254,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.center,
                      colors: [
                        Colors.transparent,
                        Color(0xff00ADEF).withOpacity(0.6),
                      ],
                    ),
                  ),
                  child: Text(
                    "instagram design example",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.s19W700(color: Colors.white),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
