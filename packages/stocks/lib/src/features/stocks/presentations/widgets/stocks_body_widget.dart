import 'package:your_stock_design_system/your_stock_design_system.dart';

import 'widgets.dart';

class StocksBodyWidget extends StatelessWidget {
  const StocksBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: bestStocks.length,
      itemBuilder: (context, index) => StocksItemWidget(
        name: bestStocks.values.elementAt(index),
        ticker: bestStocks.keys.elementAt(index),
      ),
      separatorBuilder: (context, index) => const AppDivider(),
    );
  }

  Map<String, String> get bestStocks => {
        'TSLA': 'Tesla, Inc.',
        'PLTR': 'Palantir Technology Inc.',
        'F': 'Ford Motor Company',
        'AMZN': 'Amazon.com Inc.',
        'MRVL': 'Marvell Technology Inc.',
        'AMD': 'Advanced Micro Devices Inc.',
        'INTC': 'Intel Corporation',
        'NVDA': 'NVIDIA Corporation',
        'BAC': 'Bank of America Corporation',
        'AAPL': 'Apple Inc.',
        'AI': 'C3.ai, Inc.',
        'T': 'AT&T Inc.',
        'NIO': 'NIO Inc',
        'MSFT': 'Microsoft Corporation',
        'CMCSA': 'Comcast Corporation',
        'GOOGL': 'Alphabet Inc.',
        'MU': 'Micron Technology Inc.',
        'GPS': 'The Gap. Inc',
        'CCL': 'Carnival Corporation & plc',
        'ITUB': 'Itau Unibanco Holding S.A.',
        'SOFI': 'SoFi Technology Inc.',
        'RIVN': 'Rivian Automotive Inc.',
        'PDD': 'PDD Holding Inc.',
        'PARA': 'Paramount Global',
        'TSM': 'Taiwan Semiconductor Manufacturing Company Limited'
      };
}
