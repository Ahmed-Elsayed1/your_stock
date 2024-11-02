import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:your_stock/src/data/models/news.dart';
import 'package:your_stock/src/data/repository/news_repository.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepository newsRepository;
  List<News> news = [];

  NewsCubit(
    this.newsRepository,
  ) : super(NewsInitial());

  List<News> getAllNews() {
    emit(NewsLoading());
    newsRepository.getAllNews().then((news) {
      emit(NewsLoaded(news));
      this.news = news;
    });
    return news;
  }
}
