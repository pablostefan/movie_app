import 'package:flutter/material.dart';
import 'package:movie_app/core/injection/injection.dart';
import 'package:movie_app/features/movies/presentations/pages/movies_page.dart';
import 'package:oktoast/oktoast.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
    Injection.init();
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
        position: ToastPosition.top,
        textPadding: EdgeInsets.zero,
        dismissOtherOnShow: true,
        child: MaterialApp(
            title: 'Movies App',
            theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), useMaterial3: true),
            home: const MoviesPage()));
  }
}
