import 'package:flutter/cupertino.dart';
import 'package:only_guides/core/app_colors.dart';
import 'package:only_guides/core/app_text_styles.dart';

showPremiumAlert(BuildContext context) {
  showCupertinoDialog(
    barrierDismissible: true,
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text(
        '🙁',
        style: AppTextStyles.s40W700(),
      ),
      content: Text(
        'Sorry, access to all music is\navailable only for premium users',
        style: AppTextStyles.s16W400(),
      ),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context);
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const PremiumScreen(
            //       isPop: true,
            //     ),
            //   ),
            // );
          },
          child: Text(
            'Buy Premium for \$1.99',
            style: AppTextStyles.s16W600(
              color: AppColors.color00ADEFBlue1,
            ),
          ),
        ),
      ],
    ),
  );
}
