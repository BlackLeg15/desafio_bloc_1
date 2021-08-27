import 'package:dio/dio.dart';

import '../../../../../core/constants/endpoints.dart';
import '../../../../../core/errors/datasource_error.dart';
import '../../../../../core/services/http_service.dart';
import '../../../domain/entities/anime_post_entity.dart';
import '../../../domain/params/get_all_posts_params.dart';
import '../../../infra/datasources/get_all_posts_datasource.dart';
import 'mapper/get_all_posts_from_api_mapper.dart';

class GetAllPostsFromApiDatasource implements GetAllPostsDatasource {
  final HttpService _httpService;

  GetAllPostsFromApiDatasource(this._httpService);

  @override
  Future<List<AnimePostEntity>> getAllPosts(GetAllPostsParams params) async {
    try {
      final response = await _httpService.get(Endpoints.postsUrl(params.page, params.numberOfPostsPerPage));
      final postList = GetAllPostsFromApiMapper.fromJsonList(response.data);
      return postList;
    } on DioError catch (e, s) {
      throw DataSourceError('${e.response?.data['message']}', s);
    } catch (e, s) {
      throw DataSourceError('Erro: ${e.toString()}', s);
    }
  }
}
