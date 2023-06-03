import 'package:flutter/material.dart';
import 'package:yourstock/services/crud/cloud_firestore_service.dart';
import 'package:yourstock/services/crud/crud_exception.dart';
import 'package:yourstock/utilities/show_error_dialog.dart';

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({Key? key}) : super(key: key);

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  late final CloudDb cloudDb;

  @override
  void initState() {
    cloudDb = CloudDb();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        return ListTile(
                          title: Text(ticker ?? 'No Name'),
                          // subtitle: Text(match?.symbol ?? 'No Symbol'),
                          // trailing: Text(match?.region ?? 'No Region'),
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
