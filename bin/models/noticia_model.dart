class NoticiaModel {
  final int id;
  final String title;
  final String description;
  final String image;
  final DateTime createdAt;
  final DateTime? updatedAt;
  
  NoticiaModel({
    required this.id,
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
}
