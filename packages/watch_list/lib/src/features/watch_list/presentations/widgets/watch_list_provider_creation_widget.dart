import 'package:your_stock_core/your_stock_core.dart';
import 'package:your_stock_design_system/your_stock_design_system.dart';

import '../cubit/cubit.dart';

class WatchListProviderCreationWidget extends StatelessWidget {
  const WatchListProviderCreationWidget({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WatchListCubit>()..getWatchList(),
      child: child,
    );
  }
}
