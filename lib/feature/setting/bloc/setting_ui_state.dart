import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_ui_state.freezed.dart';

@freezed
class SettingUiState with _$SettingUiState {
  factory SettingUiState({
    String? test
  }) = _SettingUiState;
}
