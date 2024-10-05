import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/features/movies/presentations/controllers/search_controller.dart';

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
        appBar: AppBar(title: const Text('Movies')),
        body: ListenableBuilder(
            listenable: _controller,
            builder: (_, __) {
              return ListView.separated(
                  itemCount: _controller.movies.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (_, index) {
                    return ListTile(title: Text(index.toString(), style: TextStyle(color: Colors.black)));
                  });
            }));
  }
}
