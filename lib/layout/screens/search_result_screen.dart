// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:yourstock/shared/cubit/cubit.dart';
// import 'package:yourstock/shared/cubit/states.dart';
// import 'package:yourstock/models/search_model.dart';

// class SearchResultScreen extends StatelessWidget {
//   const SearchResultScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AppCubit, AppStates>(
//       builder: (context, state) {
//         if (state is SearchState) {
//           return ListView.builder(
//             itemCount: state.searchSymbol?.bestMatches?.length ?? 0,
//             itemBuilder: (BuildContext context, int index) {
//               BestMatches? match = state.searchSymbol?.bestMatches?[index];
//               return ListTile(
//                 title: Text(match?.name ?? 'No Name'),
//                 subtitle: Text(match?.symbol ?? 'No Symbol'),
//                 trailing: Text(match?.region ?? 'No Region'),
//               );
//             },
//           );
//         } else if (state is StocksGetStocksErrorState) {
//           return Center(
//             child: Text('Error: ${state.error}'),
//           );
//         } else {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       },
//     );
//   }
// }
