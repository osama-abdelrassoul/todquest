part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class ChangeSearchTypeEvent extends SearchEvent {
  const ChangeSearchTypeEvent({required this.searchType});
  final String searchType;
  @override
  List<Object> get props => [searchType];
}

class ChangeSearchKeyEvent extends SearchEvent {
  const ChangeSearchKeyEvent({required this.searchKey});
  final String searchKey;
  @override
  List<Object> get props => [searchKey];
}

class GetSearchDataEvent extends SearchEvent {
  const GetSearchDataEvent();
}
