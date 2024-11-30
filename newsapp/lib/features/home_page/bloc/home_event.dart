part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}
class HomeFetchNewsEvent extends HomeEvent {
  final String language;
  final String phrases;
  final String category;
  HomeFetchNewsEvent({required this.language,required this.phrases,required this.category});

}
class HomeDetailedNewsEvent extends HomeEvent {
  final Article article;
  HomeDetailedNewsEvent(this.article);
}
class HomeNewsExtendsEvent extends HomeEvent {

}

class HomeFilterNewsEvent extends HomeEvent {
  final String Keyword;
  HomeFilterNewsEvent({required this.Keyword});
}

