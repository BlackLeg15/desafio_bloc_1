import 'package:equatable/equatable.dart';

class BlogPostEntity extends Equatable {
  final String? title;
  final String? publicationDate;
  final String? description;
  final String? link;
  final String? id;

  const BlogPostEntity({this.title, this.publicationDate, this.description, this.link, this.id});

  @override
  List<Object?> get props => [id];
}
