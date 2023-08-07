import '../../../../domain/entities/blog_post_entity.dart';
import '../../../../domain/errors/get_posts_error.dart';

class GetAllPostsFromApiMapper {
  List<BlogPostEntity> fromJsonList(List jsonList) {
    return jsonList.map((e) => fromJson(e)).toList();
  }

  BlogPostEntity fromJson(Map<String, dynamic> json) {
    checkKey(json, 'title', 'Campo title não existe/é nulo. Response: $json');
    checkKey(json['title'], 'rendered', 'Campo title.rendered não existe/é nulo. Response: $json');
    checkKey(json, 'date', 'Campo date não existe/é nulo. Response: $json');
    checkKey(json, 'excerpt', 'Campo excerpt não existe/é nulo. Response: $json');
    checkKey(json['excerpt'], 'rendered', 'Campo excerpt.rendered não existe/é nulo. Response: $json');
    checkKey(json, 'link', 'Campo excerpt.rendered não existe/é nulo. Response: $json');
    checkKey(json, 'id', 'Campo id não existe/é nulo. Response: $json');

    final title = json['title']?['rendered'];
    final publicationDate = json['date'];
    final description = json['excerpt']!['rendered'];
    final link = json['link'];
    final id = json['id'];

    return BlogPostEntity(
      title: title,
      publicationDate: publicationDate,
      description: description,
      link: link,
      id: id.toString(),
    );
  }

  void checkKey(Map map, String key, String exceptionMessage) {
    if (!map.containsKey(key)) {
      throw GetPostsMapperError(message: exceptionMessage);
    }
    if (map[key] == null) {
      throw GetPostsMapperError(message: exceptionMessage);
    }
  }
}
