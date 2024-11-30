import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsapp/models/news_model/news_model.dart';
import 'package:newsapp/repos/fetch_news/fetch_news.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeFetchNewsEvent>(homeFetchNewsEvent);
    on<HomeDetailedNewsEvent>(homeDetailedNewsEvent);

  }
  Future<void> homeFetchNewsEvent(
      HomeFetchNewsEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    List<Article> news = [];
    news = await FetchNews(event.language,event.phrases,event.category).fetchNews();
    print(news.length);
    emit(HomeLoadedState(news));
  }

  FutureOr<void> homeDetailedNewsEvent(
      HomeDetailedNewsEvent event, Emitter<HomeState> emit) {
      emit(HomeDetailedNewsState(event.article));
  }
}


