import 'package:common/common.dart';
import 'package:your_stock_core/your_stock_core.dart';

import '../../data/data.dart';

@injectable
class NewsRepository {
  final NewsDataSource newsDataSource;

  NewsRepository(this.newsDataSource);

  Future<List<NewsModel>> getAllNews() async {
    final news = await newsDataSource.getAllNews();
    return news.map((news) => NewsModel.fromJson(news)).toList();
  }
}
