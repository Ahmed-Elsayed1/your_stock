import 'package:your_stock_design_system/your_stock_design_system.dart';

import '../widgets/widgets.dart';

Future<T?> showSearchBottomSheet<T>(BuildContext context) async =>
    await showAppModalBottomSheet<T>(
      context,
      isScrollControlled: true,
      maxHeight: MediaQuery.of(context).size.height * 0.8,
      body: const SearchProviderCreationWidget(
        child: SearchProviderConsumerWidget(),
      ),
    );
