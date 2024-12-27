import 'package:your_stock_core/your_stock_core.dart';

part 'global_state.freezed.dart';

@freezed
class GlobalState with _$GlobalState {
  const factory GlobalState.initial() = _Initial;
  const factory GlobalState.loading() = _Loading;
  const factory GlobalState.loaded() = _Loaded;
  const factory GlobalState.error(String error) = _Error;
  const factory GlobalState.onNavChange() = _OnNavChange;
}
