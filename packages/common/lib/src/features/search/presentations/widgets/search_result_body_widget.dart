import 'package:your_stock_core/your_stock_core.dart';
import 'package:your_stock_design_system/your_stock_design_system.dart';
import 'package:stocks/stocks.dart';

import '../cubit/cubit.dart';

class SearchResultBodyWidget extends StatelessWidget {
  const SearchResultBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (BuildContext context, SearchState state) {
        return state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (searchSymbol) {
            var matches = searchSymbol.bestMatches;
            return matches != null && matches.isNotEmpty
                ? ListView.builder(
                    itemCount: matches.length,
                    itemBuilder: (BuildContext context, int index) =>
                        matches[index].region == "United States"
                            ? StockItemWidget(
                                name: matches[index].name,
                                ticker: matches[index].symbol,
                                region: matches[index].region,
                                onTap: () => context.router.push(
                                  StockDetailsRoute(
                                    symbol: '${matches[index].symbol}',
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                  )
                : const SizedBox.shrink();
          },
        );
      },
    );
  }
}
