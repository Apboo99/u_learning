
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/pages/main_pages/home_page/bloc/page_view_event.dart';
import 'package:u_learning/pages/main_pages/home_page/bloc/page_view_state.dart';

class PageViewBloc extends Bloc<PageViewEvent, PageViewInitial> {
  PageViewBloc() : super(PageViewInitial()) {
    on<HomePageDots>(_movePageViewEvent);
  }
  void _movePageViewEvent(HomePageDots event, Emitter<PageViewInitial>emit){
    emit(PageViewInitial(index: event.index));
  }
}
