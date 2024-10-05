class API {
  static String imageLink(String img) => 'https://image.tmdb.org/t/p/w500/$img';
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const String trendingMovies = 'trending/movie/week';
  static const String searchMovies = 'search/movie';
  static const Map<String, String> headers = {
    'authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwNzhlNmIxODMwODQ3MmMxMmQ2YWUwNDc5MTliY2RiZiIsIm5iZiI6MTcyODA5NTY0OC4zMTA1NDYsInN1YiI6IjY0NTEzZDlhNDM1MDExMDBlYTNhMTk1ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.J2Gju5G6gE0_Twm-hVIpwGQxydd-utKgFlzV9rPYTZE'
  };
}
