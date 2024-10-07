import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/features/movies/presentations/controllers/movies_controller.dart';
import 'package:movie_app/features/movies/presentations/pages/search_page.dart';
import 'package:movie_app/features/movies/presentations/theme/app_colors.dart';
import 'package:movie_app/features/movies/presentations/theme/app_dimens.dart';
import 'package:movie_app/features/movies/presentations/widgets/movie_card_widget.dart';

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
              return ListView.separated(
                  padding: const EdgeInsets.all(AppDimens.xxxs),
                  controller: _controller.scrollController,
                  itemCount: _controller.movies.length,
                  separatorBuilder: (_, __) => const SizedBox(height: AppDimens.xxxs),
                  itemBuilder: (_, index) {
                    return MovieCardWidget(movie: _controller.movies.elementAt(index));
                  });
            }));
  }
}
