class API {
  static String imageLink(String img) => '${const String.fromEnvironment("IMAGE_URL")}/$img';
  static const String baseUrl = String.fromEnvironment("BASE_URL");
  static const String trendingMovies = String.fromEnvironment("TRENDING_MOVIES_URL");
  static const String searchMovies = String.fromEnvironment("SEARCH_MOVIES_URL");
  static const Map<String, String> headers = {
    'authorization': 'Bearer ${const String.fromEnvironment("BEARER_TOKEN")}'
  };
}
