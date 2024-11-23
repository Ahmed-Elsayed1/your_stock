import 'package:your_stock_core/your_stock_core.dart';

@injectable
class NewsDataSource {
  late Dio dio;

  NewsDataSource() {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://www.alphavantage.co/',
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllNews() async {
    try {
      Response response = await dio.get(
          'query?function=NEWS_SENTIMENT&keywords=&language=en&apikey=ISYLTRHMSV89JIIE');
      return response.data['feed'];
    } catch (e) {
      return [];
    }
  }
}
