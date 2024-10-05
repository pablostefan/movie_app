import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/features/movies/presentations/controllers/movies_controller.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  late final MoviesController _controller = GetIt.I.get<MoviesController>();

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
