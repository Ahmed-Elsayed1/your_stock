import 'package:your_stock/data/models/news.dart';
import 'package:your_stock/data/web_services/news_stock_webservices.dart';

class NewsStockRepository {
  final NewsStockWebServices newsStockWebServices;

  NewsStockRepository(this.newsStockWebServices);

  Future<List<News>> getAllNews({String? symbol}) async {
    final news = await newsStockWebServices.getAllNews(symbol: symbol);
    return news.map((news) => News.fromJson(news)).toList();
  }
}
