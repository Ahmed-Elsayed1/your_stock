import 'package:common/common.dart';
import 'package:your_stock_core/your_stock_core.dart';

import '../../domain/domain.dart';
import 'stock_news_state.dart';

@injectable
class StockNewsCubit extends Cubit<StockNewsState> {
  final StockNewsRepository newsStockRepository;
  String? symbol;
  List<NewsModel> news = [];

  StockNewsCubit(
    this.newsStockRepository,
  ) : super(const StockNewsState.initial());

  List<NewsModel> getAllNews({String? symbol}) {
    emit(const StockNewsState.loading());
    newsStockRepository.getAllNews(symbol: symbol).then((news) {
      emit(StockNewsState.loaded(news));
      this.news = news;
    });
    return news;
  }
}
