import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'learning_reminders_event.dart';
part 'learning_reminders_state.dart';

class LearningRemindersBloc extends Bloc<LearningRemindersEvent, LearningRemindersState> {
  LearningRemindersBloc() : super(LearningRemindersInitial()) {
    on<LearningRemindersEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
