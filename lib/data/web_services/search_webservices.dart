import 'package:dio/dio.dart';

class SearchWebServices {
  late Dio dio;

  SearchWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://www.alphavantage.co/',
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getData({String? symbol}) async {
    try {
      Response response = await dio.get(
          'query?function=SYMBOL_SEARCH&keywords=$symbol&apikey=EA1CT9M28NTKEHPS');
      return response.data['bestMatches'];
    } catch (e) {
      return [];
    }
  }
}