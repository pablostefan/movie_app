import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:movie_app/features/movies/presentations/controllers/search_movies_controller.dart';
import 'package:movie_app/features/movies/presentations/widgets/movie_card_widget.dart';
import 'package:movie_app/features/movies/presentations/widgets/search_text_field_widget.dart';
import 'package:movie_app/shared/theme/app_colors.dart';
import 'package:movie_app/shared/theme/app_dimens.dart';

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
        body: ListenableBuilder(
            listenable: _controller,
            builder: (_, __) {
              return ModalProgressHUD(
                  inAsyncCall: _controller.isLoading.value,
                  child: Column(children: [
                    Padding(
                        padding:
                            const EdgeInsets.only(top: AppDimens.xxxs, right: AppDimens.xxxs, left: AppDimens.xxxs),
                        child: ValueListenableBuilder(
                            valueListenable: _controller.isConnected,
                            builder: (_, value, __) {
                              return SearchTextFieldWidget(controller: _controller.searchController, enabled: value);
                            })),
                    Expanded(
                        child: ListView.separated(
                            shrinkWrap: true,
                            controller: _controller.scrollController,
                            itemCount: _controller.movies.length,
                            padding: const EdgeInsets.all(AppDimens.xxs),
                            separatorBuilder: (_, __) => const SizedBox(height: AppDimens.xxs),
                            itemBuilder: (_, index) {
                              return MovieCardWidget(movie: _controller.movies.elementAt(index));
                            }))
                  ]));
            }));
  }
}
