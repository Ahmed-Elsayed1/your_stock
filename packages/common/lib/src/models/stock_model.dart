import 'package:common/src/models/interaday_model.dart';

class StockModel {
  String? name;
  List<InteradayModel>? timeSeries;

  StockModel({
    this.timeSeries,
  });

  factory StockModel.fromJson(Map<String, dynamic> map,{String? function}) {
    final timeSeries = <InteradayModel>[];
    final timeSeriesData = map['$function'];
    if (timeSeriesData != null) {
      timeSeriesData.forEach((key, value) {
        timeSeries.add(InteradayModel.fromJson(value));
      });
    }
    return StockModel(
      timeSeries: timeSeries,
    );
  }
}
