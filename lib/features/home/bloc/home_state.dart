part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<User> users;

  const HomeState({this.users = const []});

  @override
  List<Object> get props => [users];

  HomeState copyWith({
    List<User>? users,
  }) {
    return HomeState(
      users: users ?? this.users,
    );
  }
}
