import '../infra/database/db_configuration.dart';
import '../models/usuario_model.dart';
import 'dao.dart';

class UsuarioDAO implements DAO {
  final DBConfiguration _dbConfiguration;
  UsuarioDAO(this._dbConfiguration);

  @override
  Future create(value) async {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future delete(int id) async {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future findOne(int id) async {
    final String sql = 'SELECT * FROM users WHERE id = ?';
    var connection = await _dbConfiguration.connection;
    List result = await connection.query(sql, [id]);
    if (result.isEmpty) {
      throw Exception('[ERROR/DB] -> findOne for id: $id, Not Found.');
    }
    return UsuarioModel.fromMap(result.first);
  }

  @override
  Future<List> findAll() async {
    final String sql = 'SELECT * FROM users';
    var connection = await _dbConfiguration.connection;
    var result = await connection.query(sql);
    return (result).map((e) => UsuarioModel.fromMap(e.fields)).toList();
  }

  @override
  Future update(value) async {
    // TODO: implement update
    throw UnimplementedError();
  }
}
