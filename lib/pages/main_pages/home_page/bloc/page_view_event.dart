
abstract class PageViewEvent {}

class HomePageDots extends PageViewEvent{
   int index;
   HomePageDots({required this.index});
}