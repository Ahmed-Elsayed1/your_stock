import 'package:common/common.dart';
import 'package:your_stock_core/your_stock_core.dart';

part 'stock_details_state.freezed.dart';

@freezed
class StockDetailsState with _$StockDetailsState {
  const factory StockDetailsState.initial() = _Initial;
  const factory StockDetailsState.loading() = _Loading;
  const factory StockDetailsState.loaded({
    required StockModel stocks,
    required List<String> date,
    required List<DataPointModel> chartData,
  }) = _Loaded;
  const factory StockDetailsState.error(String error) = _Error;

  const factory StockDetailsState.descriptionLoading() = _DescriptionLoading;
  const factory StockDetailsState.descriptionLoaded(String description) =
      _DescriptionLoaded;
  const factory StockDetailsState.descriptionError(String error) =
      _DescriptionError;
}
