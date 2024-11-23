class InteradayModel {
  final String open;
  final String high;
  final String low;
  final String close;
  final String volume;

  const InteradayModel({
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
  });

  factory InteradayModel.fromJson(Map<String, dynamic> map) => InteradayModel(
        open: map['1. open'] as String,
        high: map['2. high'] as String,
        low: map['3. low'] as String,
        close: map['4. close'] as String,
        volume: map['5. volume'] as String,
      );
}
