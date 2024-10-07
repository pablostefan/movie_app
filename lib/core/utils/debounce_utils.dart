import 'dart:async';
import 'dart:ui';

class Debounce {
  static Timer? _timer;

  static call(VoidCallback action, {int milliseconds = 300}) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
