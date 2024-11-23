import 'package:dio/dio.dart';

class DescriptionDataSource {
  late Dio dio;

  DescriptionDataSource() {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://www.alphavantage.co/',
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getDescribtion() async {
    try {
      Response response = await dio
          .get('query?function=OVERVIEW&symbol=AMZN&apikey=NVAH17YJ5L72UTGJ');
      return response.data['Description'];
    } catch (e) {
      return [];
    }
  }
}
