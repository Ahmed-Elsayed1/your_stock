import 'package:common/common.dart';
import 'package:your_stock_core/your_stock_core.dart';

part 'stock_news_state.freezed.dart';

@freezed
class StockNewsState with _$StockNewsState {
  const factory StockNewsState.initial() = _Initial;
  const factory StockNewsState.loading() = _Loading;
  const factory StockNewsState.loaded(List<NewsModel> news) = _Loaded;
  const factory StockNewsState.error() = _Error;
  const factory StockNewsState.onNewsSuccess() = _OnNewsSuccess;
}
