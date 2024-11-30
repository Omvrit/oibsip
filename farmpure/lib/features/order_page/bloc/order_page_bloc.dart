import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'order_page_event.dart';
part 'order_page_state.dart';

class OrderPageBloc extends Bloc<OrderPageEvent, OrderPageState> {
  OrderPageBloc() : super(OrderPageInitial()) {
    on<OrderPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
