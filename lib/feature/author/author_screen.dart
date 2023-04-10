import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:only_guides/core/app_colors.dart';
import 'package:only_guides/core/app_text_styles.dart';
import 'package:only_guides/feature/author/widget/widget_container.dart';
import 'package:only_guides/logic/blocs/get_presets_cubit/get_presets_cubit.dart';
import 'package:only_guides/widgets/app_error_text.dart';
import 'package:only_guides/widgets/app_indicator.dart';

class AuthorScreen extends StatelessWidget {
  const AuthorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetPresetsCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Text(
                  "Presets",
                  style:
                      AppTextStyles.s19W700(color: AppColors.color008BCEBlue2),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: BlocBuilder<GetPresetsCubit, GetPresetsState>(
                    builder: (context, state) {
                      return state.when(
                        loading: () => const AppIndicator(),
                        error: (error) => AppErrorText(error: error),
                        success: (model) => ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) => WidgetContainer(
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
