import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todquest/core/models/user.dart';

import '../../../cloud_firestore/cloud_firestore.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState()) {
    on<ChangeSearchTypeEvent>(_handleChangeSearchTypeEvent);
    on<ChangeSearchKeyEvent>(_handleChangeSearchKeyEvent);
    on<GetSearchDataEvent>(_handleGetSearchDataEvent);
  }

  Future<void> _handleChangeSearchTypeEvent(
      ChangeSearchTypeEvent event, Emitter<SearchState> emit) async {
    emit(state.copyWith(searchType: event.searchType));
  }

  Future<void> _handleChangeSearchKeyEvent(
      ChangeSearchKeyEvent event, Emitter<SearchState> emit) async {
    emit(state.copyWith(searchKey: event.searchKey));
  }

  Future<void> _handleGetSearchDataEvent(
      GetSearchDataEvent event, Emitter<SearchState> emit) async {
    if (state.searchKey.contains("@")) {
      List<User> herblist = await CloudFirestore().search(
          type: "email", searchKey: state.searchKey, place: state.searchType);

      emit(state.copyWith(users: herblist));
    } else {
      state.copyWith(users: const []);
      List<User> users = await CloudFirestore().search(
          type: "name", searchKey: state.searchKey, place: state.searchType);
      emit(state.copyWith(users: users));
    }
  }
}
