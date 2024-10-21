import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_stock/layout/screens/news_screen.dart';
import 'package:your_stock/layout/screens/settings_screen.dart';
import 'package:your_stock/shared/cubit/states.dart';
import 'package:your_stock/layout/screens/stocks_screen.dart';
import 'package:your_stock/layout/screens/watchlist_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  get suggestedStocks => null;

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.bar_chart_rounded,
      ),
      label: 'Stocks',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.favorite_border_outlined,
      ),
      label: 'Watchlist',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.newspaper_rounded,
      ),
      label: 'News',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.settings,
      ),
      label: 'Settings',
    ),
  ];

  List<Widget> screens = [
    StocksScreen(),
    const WatchlistScreen(),
    NewsScreen(),
    const SettingsScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(AppBottomNavState());
  }
}
