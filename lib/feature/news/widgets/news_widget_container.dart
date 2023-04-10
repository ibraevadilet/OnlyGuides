import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:only_guides/core/app_colors.dart';
import 'package:only_guides/core/app_text_styles.dart';
import 'package:only_guides/feature/news/news_detail_screen.dart';
import 'package:only_guides/logic/models/news_model.dart';
import 'package:only_guides/widgets/spaces.dart';

import 'package:shimmer/shimmer.dart';

class NewsWidgetContainer extends StatelessWidget {
  const NewsWidgetContainer({
    Key? key,
    required this.model,
  }) : super(key: key);
  final NewsModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailScreen(model: model),
          ),
        );
      },
      child: Container(
        width: getWidth(context),
        height: 254,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [
              Colors.transparent,
              AppColors.color008BCEBlue2,
            ],
          ),
        ),
        child: CachedNetworkImage(
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
            return Stack(
              children: [
                Container(
                  width: getWidth(context),
                  height: 254,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: NetworkImage(model.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(24),
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
                        const Color(0xff00ADEF).withOpacity(0.6),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: CachedNetworkImageProvider(
                              model.image,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            model.authorName,
                            style: AppTextStyles.s15W700(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      Text(
                        model.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.s19W700(color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        model.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.s15W400(color: Colors.white),
                      ),
                    ],
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
