// // // import 'package:bloc/bloc.dart';
// // // import 'package:yourstock/data/models/search_model.dart';
// // // import 'package:yourstock/data/repository/search_repository.dart';
// // // import 'package:meta/meta.dart';
// // //
// // // part 'search_state.dart';
// // //
// // // class SearchCubit extends Cubit<SearchState> {
// // //   final SearchRepository searchRepository;
// // //   List<Search> search =[];
// // //
// // //   SearchCubit(this.searchRepository) : super(SearchInitial());
// // //
// // //   List<Search> getData({String? symbol}){
// // //     emit(SearchLoading());
// // //     searchRepository.getData().then((search) {
// // //       emit(SearchLoaded(search));
// // //       this.search = search;
// // //     });
// // //     return search;
// // //   }
// // //
// // //
// // // }
// //
// //
// //
// // import 'package:yourstock/data/models/search_modeel.dart';
// // import 'package:dio/dio.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// //
// // class SearchCubit extends Cubit<SearchSymbol> {
// //   final Dio dio = Dio();
// //
// //   SearchCubit() : super(SearchSymbol(bestMatches: []));
// //
// //   Future<void> searchData({String? symbol}) async {
// //     String url =
// //         "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=$symbol&apikey=0G0BN7WU6YYWLWMI";
// //     try {
// //       Response response = await dio.get(url);
// //       SearchSymbol searchSymbol = SearchSymbol.fromMap(response.data);
// //       emit(searchSymbol); // Emit the new state
// //     } catch (e) {
// //       print('ERRORRRR $e');
// //     }
// //   }
// // }
//
// import 'package:bloc/bloc.dart';
// import 'package:yourstock/data/models/search_modeel.dart';
// import 'package:yourstock/data/models/search_model.dart';
// import 'package:yourstock/shared/app_cubit/search_cubit/search_state.dart';
// import 'package:dio/dio.dart';
// import 'package:meta/meta.dart';
//
//
//
// class SearchCubit extends Cubit<SearchState> {
//   final Dio dio = Dio();
//
//   SearchCubit() : super(SearchInitial());
//
//   Future<void> searchData({String? symbol}) async {
//     emit(SearchLoading());
//     String url =
//         "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=$symbol&apikey=0G0BN7WU6YYWLWMI";
//     try {
//       Response response = await dio.get(url);
//       SearchSymbol searchSymbol = SearchSymbol.fromMap(response.data);
//       emit(SearchLoaded(searchSymbol)); // Emit the new state
//     } catch (e) {
//       emit(SearchError());
//       print('ERRORRRR $e');
//     }
//   }
// }
//
//
//
//

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:yourstock/data/models/search_modeel.dart';
import 'package:yourstock/shared/app_cubit/search_cubit/search_state.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

class SearchCubit extends Cubit<SearchState> {
  final Dio dio = Dio();

  late final BehaviorSubject<String> _searchQueryController;
  StreamSubscription<String>? _searchQuerySubscription;

  SearchCubit() : super(SearchInitial()) {
    _searchQueryController = BehaviorSubject<String>();
    _searchQuerySubscription = _searchQueryController
        .debounceTime(const Duration(milliseconds: 300))
        .distinct()
        .listen((symbol) {
      searchData(symbol: symbol);
    });
  }

  Future<void> searchData({String? symbol}) async {
    emit(SearchLoading());

    String url =
        "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=$symbol&apikey=0G0BN7WU6YYWLWMI";

    try {
      Response response = await dio.get(url);
      SearchSymbol searchSymbol = SearchSymbol.fromMap(response.data);
      emit(SearchLoaded(searchSymbol));
    } catch (e) {
      emit(SearchError());
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
