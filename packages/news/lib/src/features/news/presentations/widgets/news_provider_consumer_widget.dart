import 'package:your_stock_core/your_stock_core.dart';
import 'package:your_stock_design_system/your_stock_design_system.dart';

import '../cubit/cubit.dart';
import 'widgets.dart';

class NewsProviderConsumerWidget extends StatelessWidget {
  const NewsProviderConsumerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) => state.maybeWhen(
        orElse: () => const SizedBox.shrink(),
        loading: () => const Center(
          child: CircularProgressIndicator(
            color: Colors.deepOrange,
          ),
        ),
        loaded: (news) => ListView.builder(
          itemCount: news.length,
          itemBuilder: (context, index) => NewsItem(
            news: news[index],
          ),
          cacheExtent: 1000,
        ),
      ),
    );
  }
}
