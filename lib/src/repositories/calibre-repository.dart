import 'package:library/src/services/service-locator.dart';
import 'package:library/src/components/error/index.dart';
import 'package:library/src/components/loader/bloc/loader_bloc.dart';
import 'package:library/src/services/providers/providers.dart';
import 'package:library/src/screens/book-info/book-info.dart';

class CalibreRepository {
  static final _instance = CalibreRepository._private();

  final DbProvider _dbProvider = getService<DbProvider>();
  ErrorBloc _errorBloc;
  LoaderBloc _loaderBloc;

  factory CalibreRepository(ErrorBloc errorBloc, LoaderBloc loaderBloc) {
    _instance._errorBloc = errorBloc;
    _instance._loaderBloc = loaderBloc;
    return _instance;
  }

  CalibreRepository._private();

  Future<T> _handleCommand<T>(
    Function func,
    List<dynamic> positionalArguments, [
    Map<Symbol, dynamic> namedArguments,
  ]) async {
    T data;
    // _loaderBloc.add(LoaderEventShow());
    try {
      data = await Function.apply(func, positionalArguments, namedArguments);
      // _loaderBloc.add(LoaderEventHide()); поФиксить двоное срабатывание
    } catch (error) {
      // _loaderBloc.add(LoaderEventHide()); поФиксить двоное срабатывание
      _errorBloc.add(ErrorEventShow(error.message));
    }
    return data;
  }

  Future<List<Map<String, dynamic>>> loadBooks({dynamic filters}) async {
    return _handleCommand<List<Map<String, dynamic>>>(_dbProvider.commands.loadBooks, null);
  }

  Future<Map<String, dynamic>> _loadBookInfoById(int id) async {
    var info = await _dbProvider.commands.loadBookInfo(id);
    if (info.isEmpty) {
      return null;
    }
    var book = Map<String, dynamic>.from(info.single);
    var seriesId = book['seriesId'];
    if (seriesId != null) {
      var seriesBooks = await _dbProvider.commands.loadSeriesBooks(seriesId, id);
      if (seriesBooks.isNotEmpty) {
        book['seriesBooks'] = seriesBooks.map((data) => BookInfoModel.fromMap(data)).toList();
      }
    }
    return book;
  }

  Future<Map<String, dynamic>> loadBookInfo(int id) async {
    return _handleCommand<Map<String, dynamic>>(_loadBookInfoById, [id]);
  }
}
