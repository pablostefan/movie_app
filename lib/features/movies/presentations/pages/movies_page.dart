import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:movie_app/features/movies/presentations/controllers/movies_controller.dart';
import 'package:movie_app/features/movies/presentations/pages/search_page.dart';
import 'package:movie_app/features/movies/presentations/widgets/movie_card_widget.dart';
import 'package:movie_app/shared/theme/app_colors.dart';
import 'package:movie_app/shared/theme/app_dimens.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  final MoviesController _controller = GetIt.I.get<MoviesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.primaryGray,
            title: const Text('Filmes trending'),
            centerTitle: false,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SearchPage()));
                  },
                  icon: const Icon(Icons.search))
            ]),
        backgroundColor: AppColors.monoWhite,
        body: ListenableBuilder(
            listenable: _controller,
            builder: (_, __) {
              return ModalProgressHUD(
                  inAsyncCall: _controller.isLoading.value,
                  child: ListView.separated(
                      padding: const EdgeInsets.all(AppDimens.xxs),
                      controller: _controller.scrollController,
                      itemCount: _controller.movies.length,
                      separatorBuilder: (_, __) => const SizedBox(height: AppDimens.xxs),
                      itemBuilder: (_, index) {
                        return MovieCardWidget(movie: _controller.movies.elementAt(index));
                      }));
            }));
  }
}
