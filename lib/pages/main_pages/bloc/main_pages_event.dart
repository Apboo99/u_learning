part of 'main_pages_bloc.dart';

abstract class MainPagesEvent {
  const MainPagesEvent();
}

class MoveToGetPagesByIndexEvent extends MainPagesEvent{
  final int index;

  const MoveToGetPagesByIndexEvent(this.index):super();
}
