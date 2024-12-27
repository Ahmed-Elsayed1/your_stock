import 'package:common/common.dart';
import 'package:your_stock_core/your_stock_core.dart';

import '../../domain/domain.dart';
import 'news_state.dart';

@injectable
class NewsCubit extends Cubit<NewsState> {
  final NewsRepository newsRepository;
  NewsCubit(
    this.newsRepository,
  ) : super(const NewsState.initial());

  List<NewsModel> _news = [];
  List<NewsModel> get news => _news;

  Future<void> getAllNews() async {
    emit(const NewsState.loading());
    final result = await newsRepository.getAllNews();
    _news = news;
    emit(NewsState.loaded(result));
  }
}
