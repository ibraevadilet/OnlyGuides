part of 'get_presets_cubit.dart';

@freezed
class GetPresetsState with _$GetPresetsState {
  const factory GetPresetsState.loading() = _Loading;
  const factory GetPresetsState.error(String error) = _Error;
  const factory GetPresetsState.success(List<PresetModel> model) = _Success;
}
