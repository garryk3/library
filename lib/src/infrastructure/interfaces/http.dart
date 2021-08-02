abstract class IHttp {
  Future<dynamic> getData(String url);

  Future<dynamic> postData(String url, Map<dynamic, dynamic> data);
}
