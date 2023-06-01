import 'package:yourstock/models/search_model.dart';
import 'package:yourstock/shared/cubit/cubit.dart';

abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppBottomNavState extends AppStates {}

class GetStocksLoadingState extends AppStates {}

class StocksGetStocksSuccessState extends AppStates {}

class StocksGetStocksErrorState extends AppStates {
  late final String error;
  StocksGetStocksErrorState(this.error);
}

class StocksGetStockSymbolState extends AppStates {}

class SearchState extends AppStates {
  final SearchSymbol? searchSymbol;

  SearchState({this.searchSymbol});
}

class AppLoadingState extends AppStates {}
