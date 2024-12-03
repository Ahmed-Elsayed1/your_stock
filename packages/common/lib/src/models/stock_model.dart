import 'package:common/src/models/interaday_model.dart';

enum TimeSeries {minute, week, month }

class StockModel {
  String? name;
  String? symbol;
  List<InteradayModel>? ohlc;

  StockModel({
    this.name,
    this.symbol,
    this.ohlc,
  });

  factory StockModel.fromJson(Map<String, dynamic> map,{String? function}) {
    final ohlc = <InteradayModel>[];
    final ohlcData = map['$function'];
    if (ohlcData != null) {
      ohlcData.forEach((key, value) {
        ohlc.add(InteradayModel.fromJson(value));
      });
    }
    return StockModel(
      ohlc: ohlc,
    );
  }
}
