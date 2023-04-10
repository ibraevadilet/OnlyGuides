import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:only_guides/core/app_colors.dart';
import 'package:only_guides/core/app_images.dart';
import 'package:only_guides/core/app_text_styles.dart';
import 'package:only_guides/feature/home/widget/widget_container.dart';
import 'package:only_guides/logic/blocs/get_guides_cubit/get_guides_cubit.dart';
import 'package:only_guides/widgets/app_error_text.dart';
import 'package:only_guides/widgets/app_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetGuidesCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Guide",
                      style: AppTextStyles.s19W700(
                          color: AppColors.color008BCEBlue2),
                    ),
                    Image.asset(
                      AppImages.fireIcon,
                      width: 20,
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: BlocBuilder<GetGuidesCubit, GetGuidesState>(
                    builder: (context, state) {
                      return state.when(
                        loading: () => const AppIndicator(),
                        error: (error) => AppErrorText(error: error),
                        success: (model) => ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) => WidgetConatiner(
                            model: model[index],
                          ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 20),
                          itemCount: model.length,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
