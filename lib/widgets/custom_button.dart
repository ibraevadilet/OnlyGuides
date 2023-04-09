import 'package:flutter/material.dart';
import 'package:only_guides/core/app_colors.dart';
import 'package:only_guides/core/app_text_styles.dart';
import 'package:only_guides/widgets/app_indicator.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.color,
    this.textColor,
    this.height,
    this.isLoading = false,
    this.width,
    this.radius = 10,
    this.isGradient = false,
  }) : super(key: key);
  final String text;
  final GestureTapCallback? onPressed;
  final Color? color;
  final Color? textColor;
  final double? height;
  final double? width;
  final bool isLoading;
  final double radius;
  final bool isGradient;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : onPressed,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: !isGradient ? color ?? AppColors.color00ADEFBlue1 : null,
          gradient: isGradient
              ? const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xffABE8FF),
                    Color(0xff1E91EE),
                  ],
                )
              : null,
        ),
        height: height ?? 56,
        width: width ?? MediaQuery.of(context).size.width,
        child: isLoading
            ? const AppIndicator(color: Colors.white)
            : Text(
                text,
                style: AppTextStyles.s19W700(
                  color: textColor ?? Colors.white,
                ),
              ),
      ),
    );
  }
}
