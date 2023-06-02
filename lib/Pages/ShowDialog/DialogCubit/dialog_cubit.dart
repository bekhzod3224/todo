import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dialog_state.dart';

class DialogCubit extends Cubit<DialogState> {
  DialogCubit() : super(DialogInitial()) {
    timeout();
  }

  void timeout() {
    interval(new Duration(seconds: 15), (timer) {
      emit(DialogTimeout());
    });
  }

  Timer interval(Duration duration, func) {
    Timer function() {
      Timer timer = new Timer(duration, function);
      func(timer);
      return timer;
    }

    return new Timer(duration, function);
  }
}
