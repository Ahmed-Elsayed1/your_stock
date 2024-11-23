import 'package:common/common.dart';
import 'package:your_stock_core/your_stock_core.dart';

part 'news_state.freezed.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState.initial() = _Initial;
  const factory NewsState.loading() = _Loading;
  const factory NewsState.loaded(List<NewsModel> news) = _Loaded;
  const factory NewsState.error() = _Error;
  const factory NewsState.onNewsSuccess() = _OnNewsSuccess;
}
