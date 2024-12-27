import 'package:your_stock_design_system/your_stock_design_system.dart';
import 'package:your_stock_core/your_stock_core.dart';

class AddToWatchListButton extends StatefulWidget {
  final String symbol;

  const AddToWatchListButton({super.key, required this.symbol});
  @override
  State<StatefulWidget> createState() => _AddToWatchListButton();
}

class _AddToWatchListButton extends State<AddToWatchListButton> {
  final bool favorite = false;
  bool? isWatched;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: checkExistance(widget.symbol),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center();
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            isWatched = snapshot.data!;
            return Column(children: [
              IconButton(
                onPressed: () async {
                  await changeWatchListState(widget.symbol);
                },
                icon: Icon(
                  isWatched! ? Icons.favorite : Icons.favorite_border,
                ),
              ),
            ]);
          }
        });
  }

  Future<void> changeWatchListState(String ticker) async {
    bool isExist = await CloudDb.instance.isValueExist("ticker", ticker);
    if (isExist) {
      await CloudDb.instance.removeItemFromUserData("ticker", ticker);
      isExist = !isExist;
    } else {
      await CloudDb.instance.addItemToUserData("ticker", ticker);
      isExist = !isExist;
    }
    setState(() {
      isWatched = isExist;
    });
  }

  Future<bool> checkExistance(String ticker) async {
    bool isExist = await CloudDb.instance.isValueExist("ticker", ticker);
    return isExist;
  }
}
