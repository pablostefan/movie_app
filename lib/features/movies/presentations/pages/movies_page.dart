import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/features/movies/presentations/controllers/movies_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        appBar: AppBar(title: const Text('Movies')),
        body: Column(children: [
          TextButton(
              onPressed: () async {
                final sharedPreferences = await SharedPreferences.getInstance();
                await sharedPreferences.clear();
              },
              child: const Text('Clear')),
          Expanded(
              child: ListenableBuilder(
                  listenable: _controller,
                  builder: (_, __) {
                    return ListView.separated(
                        shrinkWrap: true,
                        controller: _controller.scrollController,
                        itemCount: _controller.movies.length,
                        separatorBuilder: (_, __) => const Divider(),
                        itemBuilder: (_, index) {
                          return ListTile(
                              title: Text(_controller.movies.elementAtOrNull(index)?.title ?? "",
                                  style: TextStyle(color: Colors.black)));
                        });
                  }))
        ]));
  }
}
