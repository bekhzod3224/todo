import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  int counter = 0;
  bool isbtn = false;
  void update() {
    counter++;
    emit(Counter());
  }

  void isBtnClicked() {
    isbtn ? isbtn = false : isbtn = true;
    emit(Counter());
  }

}
