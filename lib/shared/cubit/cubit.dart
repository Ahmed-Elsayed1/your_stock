import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yourstock/layout/screens/settings_screen.dart';
import 'package:yourstock/models/search_model.dart';
import 'package:yourstock/shared/cubit/states.dart';
import 'package:yourstock/layout/screens/stocks_screen.dart';
import 'package:yourstock/layout/screens/watchlist_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  get suggestedStocks => null;

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.web_asset,
      ),
      label: 'Stocks',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.favorite,
      ),
      label: 'Watchlist',
    ),
    // const BottomNavigationBarItem(
    //   icon: Icon(
    //     Icons.science,
    //   ),
    //   label: 'Science',
    // ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.settings,
      ),
      label: 'Settings',
    ),
  ];

  List<Widget> screens = [
    const StocksScreen(),
    const WatchlistScreen(),
    const SettingsScreen(),
    // ScienceScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(AppBottomNavState());
  }

  Dio dio = Dio();
  void searchData({String? symbol}) async {
    String url =
        "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=$symbol&apikey=0G0BN7WU6YYWLWMI";
    try {
      Response response = await dio.get(url);
      SearchSymbol searchSymbol = SearchSymbol.fromMap(response.data);
      emit(SearchState(searchSymbol: searchSymbol));
    } catch (e) {
      log('ERROR: $e');
      emit(StocksGetStocksErrorState(e.toString()));
    }
  }
}
