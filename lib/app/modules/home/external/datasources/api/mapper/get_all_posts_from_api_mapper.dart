import '../../../../domain/entities/anime_post_entity.dart';

class GetAllPostsFromApiMapper {
  List<AnimePostEntity> fromJsonList(List jsonList) {
    return jsonList.map((e) => fromJson(e)).toList();
  }

  AnimePostEntity fromJson(Map<String, dynamic> json) {
    return AnimePostEntity(
      title: json['title']?['rendered'],
      publicationDate: json['date'],
      description: json['excerpt']?['rendered'],
      link: json['link'],
    );
  }
}
