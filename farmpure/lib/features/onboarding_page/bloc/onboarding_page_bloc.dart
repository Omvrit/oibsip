import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'onboarding_page_event.dart';
part 'onboarding_page_state.dart';

class OnboardingPageBloc
    extends Bloc<OnboardingPageEvent, OnboardingPageState> {
  OnboardingPageBloc() : super(OnboardingPageInitial()) {
    on<OnboardingPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
