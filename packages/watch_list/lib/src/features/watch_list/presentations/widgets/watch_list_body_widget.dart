import 'package:stocks/stocks.dart';
import 'package:your_stock_core/your_stock_core.dart';
import 'package:your_stock_design_system/your_stock_design_system.dart';

class WatchListBodyWidget extends StatelessWidget {
  const WatchListBodyWidget({
    super.key,
    required this.tickers,
  });
  final List<String> tickers;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tickers.length,
      itemBuilder: (BuildContext context, int index) {
        final ticker = tickers[index];
        return MaterialButton(
          onPressed: () {
            context.router.push(StockDetailsRoute(symbol: ticker));
          },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/images/logos/$ticker.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const AppGap.xxxs(),
                Expanded(
                  child: ListTile(
                    title: Text(
                      ticker,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
