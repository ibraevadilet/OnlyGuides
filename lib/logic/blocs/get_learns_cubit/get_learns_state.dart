part of 'get_learns_cubit.dart';

@freezed
class GetLearnsState with _$GetLearnsState {
  const factory GetLearnsState.loading() = _Loading;
  const factory GetLearnsState.error(String error) = _Error;
  const factory GetLearnsState.success(List<LearnModel> model) = _Success;
}
