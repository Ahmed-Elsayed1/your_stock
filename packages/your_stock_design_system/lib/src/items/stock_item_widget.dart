import '../../your_stock_design_system.dart';

class StockItemWidget extends StatelessWidget {
  const StockItemWidget({
    super.key,
    this.onTap,
    this.name,
    this.ticker,
    this.region,
    this.image,
  });
  final Function()? onTap;
  final String? name;
  final String? ticker;
  final String? region;
  final ImageProvider? image;

  @override
  Widget build(BuildContext context) {
    final image = this.image;
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          if (image != null)
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          if (image != null) const AppGap.s(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name ?? "No Name",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  ticker ?? "No Symbol",
                  style: const TextStyle(
                    fontWeight: FontWeight.w100,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          if (region != null) const AppGap.s(),
          if (region != null)
            Text(
              region ?? "No Region",
              style: const TextStyle(
                fontWeight: FontWeight.w100,
              ),
              overflow: TextOverflow.ellipsis,
            ),
        ],
      ),
    );
  }
}
