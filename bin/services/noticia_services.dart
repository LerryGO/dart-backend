import '../dao/noticia_dao.dart';
import '../models/noticia_model.dart';
import 'generic_service.dart';

class NoticiaService implements GenericService<NoticiaModel> {
  final NoticiaDao _noticiaDao;

  NoticiaService(this._noticiaDao);

  @override
  Future<bool> delete(int id) async {
    _noticiaDao.delete(id);
    return true;
  }

  @override
  Future<List<NoticiaModel>> findAll() async {
    return _noticiaDao.findAll();
  }

  @override
  Future<NoticiaModel?> findOne(int id) async {
    return _noticiaDao.findOne(id);
  }

  @override
  Future<bool> save(NoticiaModel value) async {
    if (value.id != null) {
      return _noticiaDao.update(value);
    } else {
      return _noticiaDao.create(value);
    }
  }
}
