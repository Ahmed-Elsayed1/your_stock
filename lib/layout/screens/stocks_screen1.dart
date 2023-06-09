import 'package:flutter/material.dart';
import 'package:yourstock/services/crud/cloud_firestore_service.dart';
import 'package:yourstock/services/crud/crud_exception.dart';
import 'package:yourstock/shared/componentes/components.dart';
import 'package:yourstock/utilities/show_error_dialog.dart';

class StocksScreen extends StatefulWidget {
  const StocksScreen({super.key});

  @override
  State<StocksScreen> createState() => _StocksScreenState();
}

class _StocksScreenState extends State<StocksScreen> {
  var searchController = TextEditingController();
  CloudDb cloudDb = CloudDb();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: defaultFormField(
          controller: searchController,
          type: TextInputType.text,
          onChange: (value) {},
          lable: 'Search',
          validate: (String value) {
            if (value.isEmpty) {
              return 'Search must not be empty';
            }
            return null;
          },
          prefix: Icons.search,
          underLineText: 'Search must not be empty',
        ),
      ),
      ElevatedButton(
          onPressed: () async {
            try {
              await cloudDb.addItemToUserData("ticker", searchController.text);
              searchController.clear();
            } on WatchlistItemAlreadyExist {
              showErrorDialog(context, "Watchlist item already exists");
              searchController.clear();
            }
          },
          child: const Icon(Icons.add)),
      ElevatedButton(
          onPressed: () async {
            try {
              await cloudDb.removeItemFromUserData(
                  "ticker", searchController.text);
              searchController.clear();
            } on CouldNotFindWatchlistItem {
              await showErrorDialog(context, "Couldn't find watchlist item");
              searchController.clear();
            }
          },
          child: const Icon(Icons.delete)),
    ]);
  }
}
