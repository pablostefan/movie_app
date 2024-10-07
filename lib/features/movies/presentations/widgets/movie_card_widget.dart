import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/api_utils.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/movies/presentations/theme/app_colors.dart';
import 'package:movie_app/features/movies/presentations/theme/app_dimens.dart';
import 'package:movie_app/features/movies/presentations/theme/typography/typography.dart';
import 'package:movie_app/features/movies/presentations/utils/movie_genre_utils.dart';
import 'package:movie_app/features/movies/presentations/widgets/cached_image_widget.dart';
import 'package:movie_app/features/movies/presentations/widgets/star_rating_widget.dart';

class MovieCardWidget extends StatelessWidget {
  final MovieEntity movie;

  const MovieCardWidget({super.key, required this.movie});

  List<BoxShadow> _boxShadow(double blurRadius) {
    return [
      BoxShadow(color: AppColors.quaternaryGray, offset: const Offset(3, 3), blurRadius: blurRadius, spreadRadius: 1),
      BoxShadow(color: AppColors.monoWhite, offset: const Offset(-3, -3), blurRadius: blurRadius, spreadRadius: 1),
    ];
  }

  List<int> get _genreIds => movie.genreIds.take(3).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: AppDimens.xxxl,
        decoration: BoxDecoration(
            color: AppColors.monoWhite, borderRadius: BorderRadius.circular(AppDimens.pico), boxShadow: _boxShadow(15)),
        child: Row(children: [
          DecoratedBox(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppDimens.pico), boxShadow: _boxShadow(10)),
              child: CachedImageWidget(imageUrl: API.imageLink(movie.posterPath))),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(AppDimens.micro),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(movie.title, maxLines: 2, style: const Text("").titleBaseBold().style),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: AppDimens.nano),
                            child: Row(children: [
                              Padding(
                                  padding: const EdgeInsets.only(right: AppDimens.nano),
                                  child: Text(movie.voteAverage.toStringAsFixed(1)).titleBaseBold()),
                              StarRatingWidget(rating: movie.voteAverage)
                            ])),
                        Wrap(
                            alignment: WrapAlignment.start,
                            spacing: AppDimens.pico,
                            runSpacing: AppDimens.nano,
                            children: _genreIds
                                .map((genreId) => Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: AppDimens.pico, vertical: AppDimens.femto),
                                    decoration: BoxDecoration(
                                        color: AppColors.monoWhite,
                                        borderRadius: BorderRadius.circular(AppDimens.pico),
                                        boxShadow: [
                                          BoxShadow(
                                              color: AppColors.tertiaryGray,
                                              offset: const Offset(2, 2),
                                              blurRadius: 5,
                                              spreadRadius: 1),
                                          const BoxShadow(
                                              color: AppColors.monoWhite,
                                              offset: Offset(-2, -2),
                                              blurRadius: 5,
                                              spreadRadius: 1),
                                        ]),
                                    child: Text(MovieGenre.getNameById(genreId) ?? "").bodyExtraSmallMedium()))
                                .toList())
                      ])))
        ]));
  }
}
