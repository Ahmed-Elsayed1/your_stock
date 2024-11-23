import 'package:common/common.dart';
import 'package:your_stock_core/your_stock_core.dart';
import 'package:flutter/material.dart';

import '../cubit/cubit.dart';
import '../widgets/widgets.dart';

@RoutePage()
class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getIt<NewsCubit>()..getAllNews(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('News'),
          centerTitle: true,
        ),
        body: buildBlocWidget(),
      ),
    );
  }

  Widget buildBlocWidget() => BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) => state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            loading: () => showLoadingIndicator(),
            loaded: (news) => buildLoadedListWidgets(news),
            error: () => showErrorWidget(),
          ));

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
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: allNews.length,
      itemBuilder: (ctx, index) {
        return NewsItem(news: allNews[index]);
      },
    );
  }

  Widget showErrorWidget() {
    return const Center(
      child: Text('Error occurred while fetching news data'),
    );
  }
}
