import 'package:your_stock_core/your_stock_core.dart';

part 'watch_list_state.freezed.dart';

@freezed
class WatchListState with _$WatchListState {
  const factory WatchListState.initial() = _initial;
  const factory WatchListState.loading() = _Loading;
  const factory WatchListState.loaded(List<String> tickers) = _Loaded;
  const factory WatchListState.error(Exception exception) = _Error;
}
