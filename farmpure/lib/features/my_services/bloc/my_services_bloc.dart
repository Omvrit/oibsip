import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_services_event.dart';
part 'my_services_state.dart';

class MyServicesBloc extends Bloc<MyServicesEvent, MyServicesState> {
  MyServicesBloc() : super(MyServicesInitial()) {
    on<MyServicesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
