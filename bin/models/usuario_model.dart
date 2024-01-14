class UsuarioModel {
  final int id;
  final String name;
  final String email;
  final bool isActive;
  final DateTime dtCreated;
  final DateTime dtUpdated;

  UsuarioModel({
    required this.id,
    required this.name,
    required this.email,
    required this.isActive,
    required this.dtCreated,
    required this.dtUpdated,
  });

  @override
  String toString() {
    return 'UsuarioModel(id: $id, name: $name, email: $email, isActive: $isActive, dtCreated: $dtCreated, dtUpdated: $dtUpdated)';
  }

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      isActive: map['is_active'] == 1,
      dtCreated: map['created_at'],
      dtUpdated: map['updated_at'],
    );
  }
}
