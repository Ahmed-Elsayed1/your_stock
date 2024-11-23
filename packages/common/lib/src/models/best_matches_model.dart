class BestMatchesModel {
  String? symbol;
  String? name;
  String? region;

  BestMatchesModel({
    this.symbol,
    this.name,
    this.region,
  });

  factory BestMatchesModel.fromJson(Map<String, dynamic> map) => BestMatchesModel(
      symbol: map['1. symbol'] as String,
      name: map['2. name'] as String,
      region: map['4. region'] as String,
    );
}
