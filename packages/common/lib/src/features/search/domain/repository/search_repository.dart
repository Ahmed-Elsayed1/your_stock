import 'package:your_stock_core/your_stock_core.dart';

import '../../../../models/models.dart';
import '../../data/data.dart';

@injectable
class SearchRepository {
  final SearchDataSource searchDataSource;

  SearchRepository(this.searchDataSource);

  Future<List<SearchSymbolModel>> getData() async {
    final search = await searchDataSource.getData();
    return search.map((search) => SearchSymbolModel.fromJson(search)).toList();
  }
}
