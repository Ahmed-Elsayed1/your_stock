import 'package:your_stock_design_system/your_stock_design_system.dart';
import 'package:your_stock_core/your_stock_core.dart';

import '../widgets/widgets.dart';

@RoutePage()
class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appbar: const AppScaffoldBar.center(
        title: 'WatchList',
      ),
      body: const WatchListProviderCreationWidget(
        child: WatchListProviderConsumerWidget(),
      ),
    );
  }
}
