import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/image_entity.dart';
part 'image.g.dart';

@JsonSerializable()
class ImageModel extends Equatable {
  final String? _path;
  final String? _name;
  final String? _type;
  final int? _size;
  final String? _mime;
  final String? _url;

  const ImageModel(
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

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
  Map<String, dynamic> toJson() => _$ImageModelToJson(this);

  ImageEntity toEntity() => ImageEntity(
      path: _path,
      name: _name,
      type: _type,
      size: _size,
      mime: _mime,
      url: _url);

  @override
  List<Object?> get props => [_path, _name, _type, _size, _mime, _url];
}
