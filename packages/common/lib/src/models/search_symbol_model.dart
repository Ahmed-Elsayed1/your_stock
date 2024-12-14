import 'package:common/src/models/best_matches_model.dart';

class SearchSymbolModel {
  List<BestMatchesModel>? bestMatches;

  SearchSymbolModel({
    required this.bestMatches,
  });

  SearchSymbolModel.fromJson(Map<String, dynamic> map) {
    if (map['bestMatches'] != null) {
      bestMatches = <BestMatchesModel>[];
      map['bestMatches'].forEach(
        (v) => bestMatches!.add(BestMatchesModel.fromJson(v)),
      );
    }
  }
}
