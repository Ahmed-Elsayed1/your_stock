import 'package:your_stock_core/your_stock_core.dart';
import 'package:your_stock_design_system/your_stock_design_system.dart';

import '../cubit/cubit.dart';
import 'widgets.dart';

class WatchListProviderConsumerWidget extends StatelessWidget {
  const WatchListProviderConsumerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WatchListCubit, WatchListState>(
      listenWhen: (context, state) => state.maybeWhen(
        orElse: () => false,
        error: (_) => true,
      ),
      listener: (context, state) => state.whenOrNull(
        error: (exception) => exception is CouldNotGetData
            ? showErrorDialog(context, "Couldn't find watchlist item")
            : showErrorDialog(context, "User data error"),
      ),
      builder: (context, state) {
        final cubit = context.read<WatchListCubit>();
        return state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          orElse: () => cubit.tickers.isNotEmpty
              ? WatchListBodyWidget(tickers: cubit.tickers)
              : const SizedBox.shrink(),
        );
      },
    );
  }
}
