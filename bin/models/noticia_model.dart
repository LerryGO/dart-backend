// ignore_for_file: public_member_api_docs, sort_constructors_first
class NoticiaModel {
  int? id;
  String? title;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? userId;

  NoticiaModel();

  factory NoticiaModel.fromMap(Map map) {
    return NoticiaModel()
      ..id = map['id']?.toInt()
      ..title = map['title']
      ..description = map['description'].toString()
      ..createdAt = map['created_at']
      ..updatedAt = map['updated_at']
      ..userId = map['user_id']?.toInt();
  }

  factory NoticiaModel.fromRequest(Map map) {
    return NoticiaModel()..title = map['title']..description = map['description']..userId = map['userId']?.toInt();
  }

  Map toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }

  @override
  String toString() {
    return 'NoticiaModel(id: $id, title: $title, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, userId: $userId)';
  }
}
