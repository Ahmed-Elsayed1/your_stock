import 'package:flutter/material.dart';
import 'package:your_stock_core/your_stock_core.dart';

import '../cubit/cubit.dart';

class SearchProviderCreationWidget extends StatelessWidget {
  const SearchProviderCreationWidget({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchCubit>(),
      child: child,
    );
  }
}
