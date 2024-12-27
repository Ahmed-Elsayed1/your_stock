import 'package:news/src/features/news/presentations/cubit/news_cubit.dart';
import 'package:your_stock_core/your_stock_core.dart';
import 'package:your_stock_design_system/your_stock_design_system.dart';

class NewsProviderCreationWidget extends StatelessWidget {
  const NewsProviderCreationWidget({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getIt<NewsCubit>()..getAllNews(),
      child: child,
    );
  }
}
