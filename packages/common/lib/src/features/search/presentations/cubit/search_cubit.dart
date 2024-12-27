import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:your_stock_core/your_stock_core.dart';

import '../../../../models/models.dart';
import 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  final Dio dio = Dio();

  late final BehaviorSubject<String> _searchQueryController;
  StreamSubscription<String>? _searchQuerySubscription;

  SearchCubit() : super(const SearchState.initial()) {
    _searchQueryController = BehaviorSubject<String>();
    _searchQuerySubscription = _searchQueryController
        .debounceTime(const Duration(milliseconds: 300))
        .distinct()
        .listen((symbol) {
      searchData(symbol: symbol);
    });
  }

  Future<void> searchData({String? symbol}) async {
    emit(const SearchState.loading());

    String url =
        "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=$symbol&apikey=0G0BN7WU6YYWLWMI";

    try {
      Response response = await dio.get(url);
      SearchSymbolModel searchSymbol =
          SearchSymbolModel.fromJson(response.data);
      emit(SearchState.loaded(searchSymbol));
    } catch (e) {
      emit(const SearchState.error());
    }
  }

  void setSearchQuery(String query) {
    _searchQueryController.add(query);
  }

  @override
  Future<void> close() {
    _searchQuerySubscription?.cancel();
    _searchQueryController.close();
    return super.close();
  }
}
