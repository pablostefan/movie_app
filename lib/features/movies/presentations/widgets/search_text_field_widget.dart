import 'package:flutter/material.dart';
import 'package:movie_app/features/movies/presentations/theme/app_colors.dart';
import 'package:movie_app/features/movies/presentations/theme/app_dimens.dart';

class SearchTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;

  const SearchTextFieldWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(AppDimens.xxxs),
        child: TextField(
            controller: controller,
            decoration: InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none, borderRadius: BorderRadius.circular(AppDimens.micro)),
                fillColor: AppColors.primaryGray,
                hintText: 'Buscar filmes')));
  }
}
