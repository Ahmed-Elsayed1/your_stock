import 'package:your_stock_core/your_stock_core.dart';

import 'watch_list_state.dart';

@injectable
class WatchListCubit extends Cubit<WatchListState> {
  WatchListCubit() : super(const WatchListState.initial());

  List<String> _tickers = [];
  List<String> get tickers => _tickers;

  getWatchList() async {
    emit(const WatchListState.loading());
    final result = await CloudDb.instance.getDocumentData();
    _tickers = [...result["ticker"]];
    emit(WatchListState.loaded([...result["ticker"]]));
  }
}
