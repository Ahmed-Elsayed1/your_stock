import 'package:flutter/material.dart';
import 'package:your_stock_core/your_stock_core.dart';
import 'package:stocks/stocks.dart';

@RoutePage()
class WatchListScreen extends StatefulWidget {
  const WatchListScreen({super.key});

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  late final CloudDb cloudDb;

  @override
  void initState() {
    cloudDb = CloudDb();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'WatchList',
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: cloudDb.getDocumentData(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    final data = snapshot.data!;
                    final tickers = data["ticker"];
                    return ListView.builder(
                      itemCount: data["ticker"].length,
                      itemBuilder: (BuildContext context, int index) {
                        final ticker = tickers[index];
                        return MaterialButton(
                          onPressed: () {
                            context.router.push(StockDetailsRoute(symbol: '$ticker'));
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
                                      image: AssetImage(
                                          'assets/images/logos/$ticker.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 0.2,
                                ),
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
                  } else if (snapshot.hasError) {
                    final error = snapshot.error;
                    if (error is CouldNotGetData) {
                      asyncShowErrorDialog(
                          context, "Couldn't find watchlist item");
                    } else if (error is GenericDataException) {
                      asyncShowErrorDialog(context, "User data error");
                    }
                  }
                  return const CircularProgressIndicator();
                default:
                  return const CircularProgressIndicator();
              }
            }));
  }
}
