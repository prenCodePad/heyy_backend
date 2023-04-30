import 'package:dio/dio.dart';

class FirebaseDio {
  final String baseUrl;
  final String key;
  const FirebaseDio({this.baseUrl = '', this.key = ''});

  Dio create() {
    return Dio(BaseOptions(validateStatus: (status) => true))..interceptors.add(AddTokenInterceptor(key: key));
  }
}

class AddTokenInterceptor extends Interceptor {
  final String key;
  AddTokenInterceptor({this.key = ''});
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    Map<String, dynamic> headers = {
      "Content-Type": "application/json",
      "Authorization": "key=$key",
    };
    options.headers.addAll(headers);
    super.onRequest(options, handler);
  }
}
