import 'package:flutter/material.dart';
import 'package:movie_app/features/movies/presentations/theme/app_colors.dart';
import 'package:movie_app/features/movies/presentations/theme/app_dimens.dart';

class SearchTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool enabled;

  const SearchTextFieldWidget({super.key, required this.controller, this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return TextField(
        enabled: enabled,
        controller: controller,
        decoration: InputDecoration(
            filled: true,
            border:
                OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(AppDimens.micro)),
            fillColor: AppColors.secondaryGray,
            hintText: 'Buscar filmes'));
  }
}
