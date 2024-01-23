import 'dart:convert';

class AuthTO {
  final String email;
  final String password;

  AuthTO({
    required this.email,
    required this.password,
  });

  @override
  String toString() => 'UsuarioTO(name: $email, password: $password)';

  factory AuthTO.fromRequest(String body) {
    var map = jsonDecode(body);
    return AuthTO(email: map['email'], password: map['password']);
  }
}
