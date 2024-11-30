part of 'home_bloc.dart';

@immutable
sealed class HomeState {}
class HomeActionState extends HomeState {

}

final class HomeInitial extends HomeState {}
final class HomeLoadingState extends HomeState {}
final class HomeLoadedState extends HomeState {
  final List<Article> news;

  HomeLoadedState(this.news);
}
final class HomeErrorState extends HomeState {

}
final class HomeNewsExtendsState extends HomeState {


}
final class HomeDetailedNewsState extends HomeState {
  final Article article;
  HomeDetailedNewsState(this.article);

}




