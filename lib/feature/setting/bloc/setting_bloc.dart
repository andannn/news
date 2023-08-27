import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:news/core/data/repository/user_data_repository.dart';
import 'package:news/feature/setting/bloc/setting_ui_state.dart';

part 'setting_event.dart';

class SettingBloc extends Bloc<SettingEvent, SettingUiState> {
  SettingBloc({
    required UserDataRepository userDataRepository,
  })  : _userDataRepository = userDataRepository,
        super(SettingUiState()) {
  }

  final UserDataRepository _userDataRepository;
  StreamSubscription<List<String>>? _followedTopicsChangedSub;

  @override
  Future<void> close() async {
    super.close();
    _followedTopicsChangedSub?.cancel();
  }
}
