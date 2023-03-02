part of 'search_bloc.dart';

class SearchState extends Equatable {
  const SearchState(
      {this.users = const [],
      this.searchKey = '',
      this.searchType = 'Facebook'});
  final List<User> users;
  final String searchKey;
  final String searchType;
  @override
  List<Object> get props => [users, searchKey, searchType];

  SearchState copyWith(
      {List<User>? users, final String? searchKey, final String? searchType}) {
    return SearchState(
        users: users ?? this.users,
        searchKey: searchKey ?? this.searchKey,
        searchType: searchType ?? this.searchType);
  }
}
