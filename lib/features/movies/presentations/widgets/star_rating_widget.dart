import 'package:flutter/material.dart';
import 'package:movie_app/features/movies/presentations/theme/app_colors.dart';
import 'package:movie_app/features/movies/presentations/theme/app_dimens.dart';

class StarRatingWidget extends StatelessWidget {
  final double rating;
  final double starSize;
  final Color color;

  const StarRatingWidget({
    super.key,
    required this.rating,
    this.starSize = AppDimens.xxxs,
    this.color = AppColors.starColor,
  });

  double get _adjustedRating => (rating / 2).clamp(0.0, 5.0);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(5, (index) {
          double starValue = _adjustedRating - index;

          IconData icon;
          if (starValue >= 1) {
            icon = Icons.star;
          } else if (starValue >= 0.5) {
            icon = Icons.star_half;
          } else {
            icon = Icons.star_border;
          }

          return Icon(icon, color: color, size: starSize);
        }));
  }
}
