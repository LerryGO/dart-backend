import '../infra/database/db_configuration.dart';
import '../models/usuario_model.dart';
import 'dao.dart';

class UsuarioDAO implements DAO<UsuarioModel> {
  final DBConfiguration _dbConfiguration;
  UsuarioDAO(this._dbConfiguration);

  @override
  Future<bool> create(UsuarioModel value) async {
    var result = await _execQuery(
      'INSERT INTO users (name, email, password) VALUES (?, ?, ?)',
      [value.name, value.email, value.password],
    );
    return result.affectedRows > 0;
  }

  @override
  Future<bool> delete(int id) async {
    var result = await _execQuery('DELETE from users where id = ?', [id]);
    return result.affectedRows > 0;
  }

  @override
  Future<UsuarioModel?> findOne(int id) async {
    var result = await _execQuery('SELECT * FROM users WHERE id = ?', [id]);
    return result.affectedRows == 0
        ? null
        : UsuarioModel.fromMap(result.first.fields);
  }

  @override
  Future<List<UsuarioModel>> findAll() async {
    var result = await _execQuery('SELECT * FROM users');
    return result
        .map((e) => UsuarioModel.fromMap(e.fields))
        .toList()
        .cast<UsuarioModel>();
  }

  @override
  Future<bool> update(value) async {
    var result = await _execQuery(
      'UPDATE users SET name = ?, password = ? where id = ?',
      [value.name, value.password, value.id],
    );
    return result.affectedRows > 0;
  }

  _execQuery(String sql, [List? params]) async {
    var connection = await _dbConfiguration.connection;
    return await connection.query(sql, params);
  }
}