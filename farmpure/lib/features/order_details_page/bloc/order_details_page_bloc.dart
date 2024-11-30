import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'order_details_page_event.dart';
part 'order_details_page_state.dart';

class OrderDetailsPageBloc
    extends Bloc<OrderDetailsPageEvent, OrderDetailsPageState> {
  OrderDetailsPageBloc() : super(OrderDetailsPageInitial()) {
    on<OrderDetailsPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
