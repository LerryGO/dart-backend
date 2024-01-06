class NoticiaModel {
  final int? id;
  final String title;
  final String description;
  final String image;
  final DateTime createdAt;
  final DateTime? updatedAt;

  NoticiaModel({
    this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'NoticiaModel(id: $id, title: $title, description: $description, image: $image, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory NoticiaModel.fromJson(Map map) {
    return NoticiaModel(
      id: map['id'] ?? '',
      title: map['title'],
      description: map['description'],
      image: map['image'],
      createdAt: DateTime.fromMicrosecondsSinceEpoch(map['createdAt']),
      updatedAt: map['updatedAt'] != null
          ? DateTime.fromMicrosecondsSinceEpoch(map['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }
}
