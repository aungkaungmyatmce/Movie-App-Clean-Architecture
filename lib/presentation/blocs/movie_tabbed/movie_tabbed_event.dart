part of 'movie_tabbed_cubit.dart';

abstract class MovieTabbedEvent extends Equatable {
  const MovieTabbedEvent();
}

class MovieTabChangedEvent extends MovieTabbedEvent {
  final int currentTabIndex;

  MovieTabChangedEvent({this.currentTabIndex = 0});

  @override
  // TODO: implement props
  List<Object?> get props => [currentTabIndex];
}
