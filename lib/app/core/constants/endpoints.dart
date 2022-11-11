class Endpoints {
  static const String baseUrl = 'https://www.intoxianime.com/?rest_route=/wp/v2';
  static String postsUrl(int page, int postsPerPage) => '/posts&page=$page&per_page=$postsPerPage';
}
