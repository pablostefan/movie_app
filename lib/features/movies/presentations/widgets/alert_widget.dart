import 'package:flutter/material.dart';
import 'package:movie_app/core/error/base_failure.dart';
import 'package:movie_app/features/movies/presentations/theme/app_colors.dart';
import 'package:movie_app/features/movies/presentations/theme/app_dimens.dart';
import 'package:movie_app/features/movies/presentations/theme/app_opacity.dart';
import 'package:oktoast/oktoast.dart';

class AlertWidget extends StatelessWidget {
  final BaseFailure error;

  const AlertWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
        offset: const Offset(AppDimens.none, -AppDimens.micro),
        child: GestureDetector(
            onTap: () => dismissAllToast(showAnim: true),
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: AppDimens.xxxs),
                width: double.infinity,
                height: AppDimens.sm,
                padding: const EdgeInsets.symmetric(horizontal: AppDimens.xxxs),
                decoration: BoxDecoration(
                    color: AppColors.error,
                    borderRadius: BorderRadius.circular(AppDimens.nano),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.monoBlack.withOpacity(AppOpacity.oneThird),
                          offset: const Offset(AppDimens.atto, AppDimens.atto),
                          blurRadius: AppDimens.femto)
                    ]),
                child: Row(children: [
                  Icon(Icons.error, color: AppColors.monoWhite),
                  Padding(padding: const EdgeInsets.only(left: AppDimens.nano), child: Text(error.message))
                ]))));
  }
}
