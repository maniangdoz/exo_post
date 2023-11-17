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

class AddPost extends PostEvent {
  final String _content;
  final String? _base64Image;

  const AddPost({required String content, required String? base64Image})
      : _content = content,
        _base64Image = base64Image;

  String? get content => _content;
  String? get base64Image => _base64Image;

  @override
  List<Object?> get props => [_content, _base64Image];
}

class UpdatePost extends PostEvent {
  final int _postId;
  final String _content;
  final String? _base64Image;
  final String _type;

  const UpdatePost(
      {required int postId,
      required String content,
      required String? base64Image,
      required String type})
      : _postId = postId,
        _content = content,
        _type = type,
        _base64Image = base64Image;

  int? get postId => _postId;
  String? get content => _content;
  String? get type => _type;
  String? get base64Image => _base64Image;

  @override
  List<Object?> get props => [_postId, _content, _type, _base64Image];
}

class RemovePosts extends PostEvent {
  final int _postId;

  const RemovePosts({required int postId}) : _postId = postId;
  int get postId => _postId;

  @override
  List<Object?> get props => [_postId];
}
