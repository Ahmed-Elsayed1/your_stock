import 'package:flutter/material.dart';
import 'package:your_stock_core/your_stock_core.dart';

import 'global_state.dart';

@injectable
class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(const GlobalState.initial());

  get suggestedStocks => null;

  static GlobalCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.bar_chart_rounded,
      ),
      label: 'StockModel',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.favorite_border_outlined,
      ),
      label: 'WatchList',
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
    const WatchListScreen(),
    NewsScreen(),
    const SettingsScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(const GlobalState.onNavChange());
  }
}
