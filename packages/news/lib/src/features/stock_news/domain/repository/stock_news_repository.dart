import 'package:common/common.dart';
import 'package:your_stock_core/your_stock_core.dart';

import '../../data/data.dart';

@injectable
class StockNewsRepository {
  final StockNewsDataSource newsStockDataSource;

  StockNewsRepository(this.newsStockDataSource);

  Future<List<NewsModel>> getAllNews({String? symbol}) async {
    final news = await newsStockDataSource.getAllNews(symbol: symbol);
    return news.map((news) => NewsModel.fromJson(news)).toList();
  }
}
