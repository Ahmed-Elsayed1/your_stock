import 'package:your_stock_core/your_stock_core.dart';
import 'package:flutter/material.dart';
import 'package:stocks/stocks.dart';

import '../cubit/cubit.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  final SearchCubit searchCubit = SearchCubit();

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      bloc: searchCubit,
      builder: (BuildContext context, SearchState state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(""),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Search",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: const Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    searchCubit.setSearchQuery(value.isNotEmpty
                        ? value
                        : "Couldn't find what you are searching for");
                  },
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: _buildSearchResults(state),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSearchResults(SearchState state) => state.maybeWhen(
        orElse: () => const SizedBox.shrink(),
        loading: () => const Center(child: CircularProgressIndicator()),
        loaded: (searchSymbol) => ListView.builder(
          itemCount: searchSymbol.bestMatches?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            var match = searchSymbol.bestMatches![index];
            if (match.region == "United States") {
              return MaterialButton(
                onPressed: () {
                  context.router
                      .push(StockDetailsRoute(symbol: '${match.symbol}'));
                },
                child: ListTile(
                  title: Text(
                    match.name ?? "No Name",
                  ),
                  subtitle: Text(
                    match.symbol ?? "No Symbol",
                  ),
                  trailing: Text(
                    match.region ?? "No Region",
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      );
}
