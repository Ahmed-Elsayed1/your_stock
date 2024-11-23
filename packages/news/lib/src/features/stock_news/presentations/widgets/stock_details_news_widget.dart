import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:your_stock_core/your_stock_core.dart';

import '../../../news/news.dart';
import '../cubit/cubit.dart';

class StockDetailsNewsWidget extends StatelessWidget {
  final String symbol;

  const StockDetailsNewsWidget({super.key, required this.symbol});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getIt<StockNewsCubit>()..getAllNews(symbol: symbol),
      child: Container(
        child: buildBlocWidget(),
      ),
    );
  }

  Widget buildBlocWidget() => BlocBuilder<StockNewsCubit, StockNewsState>(
        builder: (context, state) => state.maybeWhen(
          loading: () => showLoadingIndicator(),
          loaded: (news) => buildLoadedListWidgets(news),
          error: () => showErrorWidget(),
          orElse: () => const SizedBox.shrink(),
        ),
      );

  Widget showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.deepOrange,
      ),
    );
  }

  Widget buildLoadedListWidgets(List<NewsModel> allNews) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            buildNewsList(allNews),
          ],
        ),
      ),
    );
  }

  Widget buildNewsList(List<NewsModel> allNews) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: allNews.isNotEmpty ? 10 : 1,
      itemBuilder: (ctx, index) {
        if (allNews.isNotEmpty) {
          return NewsItem(news: allNews[index]);
        } else {
          return const Text(
            "Couldn't find any news",
            style: TextStyle(fontWeight: FontWeight.bold),
          );
        }
      },
    );
  }

  Widget showErrorWidget() {
    return const Center(
      child: Text('Error occurred while fetching news data'),
    );
  }
}
