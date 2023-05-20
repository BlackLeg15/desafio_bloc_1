
import '../../../../../core/constants/endpoints.dart';
import '../../../../../core/services/http_client/base/http_client.dart';
import '../../../domain/entities/blog_post_entity.dart';
import '../../../domain/errors/get_posts_error.dart';
import '../../../domain/params/get_all_posts_params.dart';
import '../../../infra/datasources/get_all_posts_datasource.dart';
import 'mapper/get_all_posts_from_api_mapper.dart';

class GetAllPostsFromApiDatasource implements GetAllPostsDatasource {
  final GetAllPostsFromApiMapper _mapper;
  final HttpClient _httpService;

  GetAllPostsFromApiDatasource(this._httpService, this._mapper);

  @override
  Future<List<BlogPostEntity>> getAllPosts(GetAllPostsParams params) async {
    late List<BlogPostEntity> postList;
    try {
      final requestInput = Endpoints.postsUrl(params.page, params.numberOfPostsPerPage);
      final response = await _httpService.get(requestInput);
      response.fold(
        (exception) {
          throw const GetPostsRequestError();
        },
        (response) {
          postList = _mapper.fromJsonList(response.data);
        },
      );
      return postList;
    } catch (e) {
      rethrow;
    }
  }
}
