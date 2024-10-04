import 'package:flutter/cupertino.dart';
import 'package:movie_app/features/movies/domain/usecases/movie_usecase.dart';

class MovieController with ChangeNotifier {
  final MovieUseCase _movieUseCase;

  MovieController(this._movieUseCase) {
    _fetch();
  }

  ValueNotifier<bool> loading = ValueNotifier(false);

  void _fetch() async {
    loading.value = true;
    var result = await _movieUseCase.getMovieEntity();
    result.fold((l) => print(l), (r) => print(r));
    loading.value = false;
  }

  void _onSuccess() {
    notifyListeners();
  }

  void _onError() {
    loading.value = false;
  }
}
