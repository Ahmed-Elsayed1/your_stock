import 'package:your_stock_core/your_stock_core.dart';
import 'package:your_stock_design_system/your_stock_design_system.dart';

import '../widgets/widgets.dart';

@RoutePage()
class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NewsProviderCreationWidget(
      child: AppScaffold(
        appbar: const AppScaffoldBar.center(
          title: 'News',
        ),
        body: const NewsProviderConsumerWidget(),
      ),
    );
  }
}
