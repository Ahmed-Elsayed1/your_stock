import 'package:common/common.dart';
import 'package:your_stock_core/your_stock_core.dart';

import 'stock_details_state.dart';

@injectable
class StockDetailsCubit extends Cubit<StockDetailsState> {

  StockDetailsCubit() : super(const StockDetailsState.initial());
  final Dio _dio = Dio();

  StockModel? _stock;
  StockModel? get stock => _stock;

  TimeSeries? _timeSeries;
  TimeSeries? get timeSeries => _timeSeries;

  init(StockModel? stock){
    _stock = stock;
  }

  Future<void> getDataMinute({String? function}) async {
    emit(const StockDetailsState.loading());
    try {
      final response = await _dio.get(
        "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=${_stock?.symbol}&interval=1min&apikey=XM9TKXZLN4IK6SMG",
      );
      if (response.statusCode == 200) {
        final stocks =
            StockModel.fromJson(response.data, function: "Time Series (1min)");
        final date = response.data["Time Series (1min)"];
        final chartData = _convertToChartData(date);

        emit(StockDetailsState.loaded(
            stocks: stocks, date: date.keys.toList(), chartData: chartData));
      } else {
        emit(StockDetailsState.error('Error: ${response.statusCode}'));
      }
    } catch (e) {
      emit(const StockDetailsState.error(
          'You reached the maximum number of requests, wait for 1 minute.'));
    }
  }

  Future<void> getDataWeekly({String? function}) async {
    emit(const StockDetailsState.loading());
    try {
      final response = await _dio.get(
        "https://www.alphavantage.co/query?function=TIME_SERIES_WEEKLY&symbol=${_stock?.symbol}&apikey=JFF5XUTNZIEADCG0",
      );
      if (response.statusCode == 200) {
        final stocks =
            StockModel.fromJson(response.data, function: "Weekly Time Series");
        final date = response.data["Weekly Time Series"];
        final chartData = _convertToChartData(date);

        emit(StockDetailsState.loaded(
            stocks: stocks, date: date.keys.toList(), chartData: chartData));
      } else {
        emit(StockDetailsState.error('Error: ${response.statusCode}'));
      }
    } catch (e) {
      emit(const StockDetailsState.error(
          'You reached the maximum number of requests, wait for 1 minute.'));
    }
  }

  Future<void> getDataMonthly({String? function}) async {
    emit(const StockDetailsState.loading());
    try {
      final response = await _dio.get(
        "https://www.alphavantage.co/query?function=TIME_SERIES_MONTHLY&symbol=${_stock?.symbol}&apikey=POCMQ0KHKRNQ7JO6",
      );
      if (response.statusCode == 200) {
        final stocks =
            StockModel.fromJson(response.data, function: "Monthly Time Series");
        final date = response.data["Monthly Time Series"];
        final chartData = _convertToChartData(date);

        emit(StockDetailsState.loaded(
            stocks: stocks, date: date.keys.toList(), chartData: chartData));
      } else {
        emit(StockDetailsState.error('Error: ${response.statusCode}'));
      }
    } catch (e) {
      emit(const StockDetailsState.error(
          'You reached the maximum number of requests, wait for 1 minute.'));
    }
  }

  Future<void> getDescriptionData() async {
    emit(const StockDetailsState.descriptionLoading());
    try {
      final response = await _dio.get(
        "https://www.alphavantage.co/query?function=OVERVIEW&symbol=${_stock?.symbol}&apikey=8TNLUH11I1ZYP5EW",
      );
      if (response.statusCode == 200) {
        final data = response.data["Description"];

        emit(StockDetailsState.descriptionLoaded(data));
      } else {
        emit(StockDetailsState.descriptionError('Error: ${response.statusCode}'));
      }
    } catch (e) {
      emit(const StockDetailsState.error(
          'You reached the maximum number of requests, wait for 1 minute.'));
    }
  }

  List<DataPointModel> _convertToChartData(Map<String, dynamic> date) {
    final List<DataPointModel> chartData = [];
    date.forEach((key, value) {
      final DateTime xValue = DateTime.parse(key);
      final double open = double.parse(value['1. open']);
      final double close = double.parse(value['4. close']);
      final double high = double.parse(value['2. high']);
      final double low = double.parse(value['3. low']);
      chartData.add(DataPointModel(xValue, open, close, high, low));
    });
    return chartData;
  }

  changeTimeSeries(TimeSeries timeSeries){
    emit(StockDetailsState.onTimeSeriesChanged(timeSeries));
  }
}
