import 'package:flutter/material.dart';
import 'package:only_guides/core/app_text_styles.dart';

class WidgetRow extends StatelessWidget {
  const WidgetRow(
      {Key? key, required this.icon, required this.text, required this.onTap})
      : super(key: key);
  final String icon;
  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onTap,
          child: Row(
            children: [
              const SizedBox(width: 12),
              Image.asset(
                icon,
                width: 20,
              ),
              const SizedBox(width: 12),
              Text(
                text,
                style: AppTextStyles.s15W400(color: Colors.black),
              ),
              const Spacer(),
              const Icon(
                Icons.chevron_right,
                color: Colors.black,
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
        const Divider(
          color: Colors.black,
        )
      ],
    );
  }
}
