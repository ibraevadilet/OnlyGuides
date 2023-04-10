part of 'get_news_cubit.dart';

@freezed
class GetNewsState with _$GetNewsState {
  const factory GetNewsState.loading() = _Loading;
  const factory GetNewsState.error(String error) = _Error;
  const factory GetNewsState.success(List<NewsModel> model) = _Success;
}
