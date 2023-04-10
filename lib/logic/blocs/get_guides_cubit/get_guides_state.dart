part of 'get_guides_cubit.dart';

@freezed
class GetGuidesState with _$GetGuidesState {
  const factory GetGuidesState.loading() = _Loading;
  const factory GetGuidesState.error(String error) = _Error;
  const factory GetGuidesState.success(List<GuideModel> model) = _Success;
}
