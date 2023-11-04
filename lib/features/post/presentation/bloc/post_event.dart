part of 'post_bloc.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();
}

class GetAllPosts extends PostEvent {
  final PostRequest _repuest;

  const GetAllPosts({required PostRequest repuest}) : _repuest = repuest;
  PostRequest get request => _repuest;

  @override
  List<Object?> get props => [_repuest];
}
