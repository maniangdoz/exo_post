class Author {
  final int id;
  final String createdAt;
  final String name;

  Author({
    required this.id,
    required this.createdAt,
    required this.name,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'],
      createdAt: json['created_at'],
      name: json['name'],
    );
  }
}