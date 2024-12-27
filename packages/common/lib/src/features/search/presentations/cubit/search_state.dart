import 'package:your_stock_core/your_stock_core.dart';

import '../../../../models/search_symbol_model.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;
  const factory SearchState.loading() = _Loading;
  const factory SearchState.loaded(SearchSymbolModel searchSymbol) =
      _Loaded;
  const factory SearchState.error() = _Error;
}
