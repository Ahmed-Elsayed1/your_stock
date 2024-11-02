import 'package:your_stock/src/data/models/search_model.dart';
import 'package:your_stock/src/data/web_services/search_webservices.dart';

class SearchRepository {
  final SearchWebServices searchWebServices;

  SearchRepository(this.searchWebServices);

  Future<List<Search>> getData() async {
    final search = await searchWebServices.getData();
    return search.map((search) => Search.fromMap(search)).toList();
  }
}
