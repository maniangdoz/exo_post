import '../entities/author_entity.dart';

abstract class SharedRepo {
  Future<AuthorEntity> getInfosUser({required int userId});
}
