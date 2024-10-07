import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/features/movies/presentations/controllers/search_movies_controller.dart';
import 'package:movie_app/features/movies/presentations/theme/app_colors.dart';
import 'package:movie_app/features/movies/presentations/theme/app_dimens.dart';
import 'package:movie_app/features/movies/presentations/widgets/movie_card_widget.dart';
import 'package:movie_app/features/movies/presentations/widgets/search_text_field_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchMoviesController _controller = GetIt.I.get<SearchMoviesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Buscar filmes'), backgroundColor: AppColors.primaryGray),
        backgroundColor: AppColors.monoWhite,
        body: Column(children: [
          SearchTextFieldWidget(controller: _controller.searchController),
          Expanded(
              child: ListenableBuilder(
                  listenable: _controller,
                  builder: (_, __) {
                    return ListView.separated(
                        shrinkWrap: true,
                        controller: _controller.scrollController,
                        itemCount: _controller.movies.length,
                        padding: const EdgeInsets.symmetric(horizontal: AppDimens.xxxs),
                        separatorBuilder: (_, __) => const SizedBox(height: AppDimens.xxxs),
                        itemBuilder: (_, index) {
                          return MovieCardWidget(movie: _controller.movies.elementAt(index));
                        });
                  }))
        ]));
  }
}
