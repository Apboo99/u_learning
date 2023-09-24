import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'love_event.dart';
part 'love_state.dart';

class LoveBloc extends Bloc<LoveEvent, LoveState> {
  LoveBloc() : super(LoveInitial()) {
    on<LoveEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
