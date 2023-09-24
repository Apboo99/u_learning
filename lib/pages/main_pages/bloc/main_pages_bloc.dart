import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_pages_state.dart';

part 'main_pages_event.dart';


class MainPagesBloc extends Bloc<MainPagesEvent, MainPagesState> {
  MainPagesBloc() : super(const MainPagesState()) {
    on<MoveToGetPagesByIndexEvent>((event, emit) {
        emit(MainPagesState(index:event.index));
    });
  }
}
