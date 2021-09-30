import 'package:library/src/data/services/http.dart';
import 'package:library/src/infrastructure/interfaces/interfaces.dart';
import 'package:library/src/infrastructure/configs/configs.dart';

final Map<String, dynamic> config = HttpConfig().goodreads;

class GoodReadsProvider extends HttpService implements IHttp {
  GoodReadsProvider() : super.fromConfig(config);
}
