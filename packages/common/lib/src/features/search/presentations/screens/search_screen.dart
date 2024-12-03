import 'package:your_stock_core/your_stock_core.dart';
import 'package:your_stock_design_system/your_stock_design_system.dart';

import '../widgets/widgets.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

Future<T?> showSearchBottomSheet<T>(BuildContext context) async =>
    await showAppModalBottomSheet<T>(
      context,
      isScrollControlled: true,
      body: const SearchProviderCreationWidget(
        child: SearchProviderConsumerWidget(),
      ),
    );
