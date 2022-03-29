import 'package:dartz/dartz.dart';

import '../entities/anime_post_entity.dart';
import '../errors/get_posts_error.dart';

typedef GetPostsResult = Future<Either<GetPostsError, List<AnimePostEntity>>>;
