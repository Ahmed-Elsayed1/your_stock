import 'package:common/common.dart';
import 'package:your_stock_core/your_stock_core.dart';

import '../../domain/domain.dart';
import 'news_state.dart';

@injectable
class NewsCubit extends Cubit<NewsState> {
  final NewsRepository newsRepository;
  List<NewsModel> news = [];

  NewsCubit(
    this.newsRepository,
  ) : super(const NewsState.initial());

  List<NewsModel> getAllNews() {
    emit(const NewsState.loading());
    newsRepository.getAllNews().then((news) {
      emit(NewsState.loaded(news));
      this.news = news;
    });
    return news;
  }
}
