import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/features/movies/presentations/theme/app_colors.dart';
import 'package:movie_app/features/movies/presentations/theme/app_dimens.dart';
import 'package:movie_app/features/movies/presentations/utils/images_utils.dart';
import 'package:shimmer/shimmer.dart';

class CachedImageWidget extends StatelessWidget {
  final String imageUrl;

  const CachedImageWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(AppDimens.pico),
        child: CachedNetworkImage(
            height: AppDimens.xxxl,
            imageUrl: imageUrl,
            placeholder: (context, url) => Shimmer.fromColors(
                baseColor: AppColors.primaryGray,
                highlightColor: AppColors.secondaryGray,
                child: Container(color: AppColors.monoWhite, width: AppDimens.xxl, height: AppDimens.xxxl)),
            errorWidget: (context, url, error) => Image.asset(Images.tmdb.path)));
  }
}
