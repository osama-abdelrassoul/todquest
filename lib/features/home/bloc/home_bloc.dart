import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todquest/core/models/user.dart';
import '../../../cloud_firestore/cloud_firestore.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomepageEvent>(_handleHomeEvent);
  }
  Future<void> _handleHomeEvent(
    HomepageEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(users: await CloudFirestore().getAllData()));
  }
}
