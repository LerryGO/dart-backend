
import '../infra/database/db_configuration.dart';
import '../models/noticia_model.dart';
import 'dao.dart';

class NoticiaDao implements DAO<NoticiaModel> {

   final DBConfiguration _dbConfiguration;

  NoticiaDao(this._dbConfiguration);

  @override
  Future<bool> create(NoticiaModel value) async {
    var result = await _dbConfiguration.execQuery(
      'INSERT INTO news (title, description, user_id) VALUES (?, ?, ?)',
      [value.title, value.description, value.userId],
    );
    return result.affectedRows > 0;
  }

  @override
  Future<bool> delete(int id) async {
    var result = await _dbConfiguration.execQuery('DELETE FROM news WHERE id = ?', [id]);
    return result.affectedRows > 0;
  }

  @override
  Future<NoticiaModel?> findOne(int id) async {
    var result = await _dbConfiguration.execQuery('SELECT * FROM news WHERE id = ?', [id]);
    return result.affectedRows == 0
        ? null
        : NoticiaModel.fromMap(result.first.fields);
  }

  @override
  Future<List<NoticiaModel>> findAll() async {
    var result = await _dbConfiguration.execQuery('SELECT * FROM news');
    return result
        .map((e) => NoticiaModel.fromMap(e.fields))
        .toList()
        .cast<NoticiaModel>();
  }

  @override
  Future<bool> update(value) async {
    var result = await _dbConfiguration.execQuery(
      'UPDATE news SET title = ?, description = ? where id = ?',
      [value.title, value.description, value.id],
    );
    return result.affectedRows > 0;
  }


 

}