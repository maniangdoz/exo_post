class ImageModel {
  final String path;
  final String name;
  final String type;
  final int size;
  final String mime;
  final String url;

  ImageModel({
    required this.path,
    required this.name,
    required this.type,
    required this.size,
    required this.mime,
    required this.url,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      path: json['path'],
      name: json['name'],
      type: json['type'],
      size: json['size'],
      mime: json['mime'],
      url: json['url'],
    );
  }
}
