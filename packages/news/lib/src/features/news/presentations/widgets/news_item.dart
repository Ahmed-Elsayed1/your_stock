import 'package:common/common.dart';
import 'package:your_stock_design_system/your_stock_design_system.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NewsItem extends StatelessWidget {
  final NewsModel news;

  const NewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return InkWell(
      onTap: () {
        launchUrlString('${news.url}');
      },
      child: Padding(
        padding: EdgeInsets.all(theme.spacing.s),
        child: Row(
          children: [
            //The Image
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(theme.spacing.xs),
                image: DecorationImage(
                  image: NetworkImage('${news.bannerImage}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const AppGap.s(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${news.title}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${news.summary}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w100,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
