class Endpoints {
  static const baseUrl = 'https://www.intoxianime.com/?rest_route=/wp/v2';
  static postsUrl(int page, int postsPerPage) => '/posts&page=$page&per_page=$postsPerPage';
}
