import 'package:your_stock_core/your_stock_core.dart';
import 'package:your_stock_design_system/your_stock_design_system.dart';

import '../cubit/cubit.dart';
import 'widgets.dart';

class SearchProviderConsumerWidget extends StatelessWidget {
  const SearchProviderConsumerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Search",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              prefixIcon: const Icon(Icons.search),
            ),
            onChanged: (value) {
              cubit.setSearchQuery(
                value.isNotEmpty
                    ? value
                    : "Couldn't find what you are searching for",
              );
            },
          ),
          const AppGap.xs(),
          const Expanded(
            child: SearchResultBodyWidget(),
          ),
        ],
      ),
    );
  }
}
