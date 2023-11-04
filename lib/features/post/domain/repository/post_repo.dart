import '../entities/post_entity.dart';

abstract class PostRepo {
  Future<PostEntity> postList({required String page, required String perPage});
}
