class SingleExecution {
  static bool _isExecuting = false;

  static void runOnce(Future<void> Function() action) async {
    if (_isExecuting) return;
    _isExecuting = true;

    try {
      await action();
    } finally {
      _isExecuting = false;
    }
  }
}
