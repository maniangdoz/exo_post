import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final String page;
  final String perPage;

  const PostEntity({required this.page, required this.perPage});

  @override
  List<Object?> get props => [page, perPage];
}
