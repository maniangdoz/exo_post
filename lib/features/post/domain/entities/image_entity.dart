import 'package:equatable/equatable.dart';

class ImageEntity extends Equatable {
  final String? _path;
  final String? _name;
  final String? _type;
  final int? _size;
  final String? _mime;
  final String? _url;

  const ImageEntity(
      {required String? path,
      required String? name,
      required String? type,
      required int? size,
      required String? mime,
      required String? url})
      : _path = path,
        _name = name,
        _type = type,
        _size = size,
        _mime = mime,
        _url = url;

  String? get path => _path;
  String? get name => _name;
  String? get type => _type;
  int? get size => _size;
  String? get mime => _mime;
  String? get url => _url;

  @override
  List<Object?> get props => [_path, _name, _type, _size, _mime, _url];
}