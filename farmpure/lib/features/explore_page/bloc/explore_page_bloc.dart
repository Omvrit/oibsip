import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'explore_page_event.dart';
part 'explore_page_state.dart';

class ExplorePageBloc extends Bloc<ExplorePageEvent, ExplorePageState> {
  ExplorePageBloc() : super(ExplorePageInitial()) {
    on<ExplorePageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
