import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:only_guides/logic/models/news_model.dart';

part 'get_news_state.dart';
part 'get_news_cubit.freezed.dart';

class GetNewsCubit extends Cubit<GetNewsState> {
  GetNewsCubit() : super(const GetNewsState.loading()) {
    getNews();
  }

  Future<List<NewsModel>> getNews() async {
    emit(const GetNewsState.loading());
    try {
      final news = await getNewsFromServer();
      emit(GetNewsState.success(news));
      return news;
    } catch (e) {
      emit(GetNewsState.error(e.toString()));
      return [];
    }
  }

  Future<List<NewsModel>> getNewsFromServer() async {
    final snapshot = await FirebaseDatabase.instance.ref('news').get();

    final newsFromServer = <NewsModel>[];
    if (snapshot.value != null) {
      final map = snapshot.value as Map<dynamic, dynamic>;

      map.forEach((key, value) {
        value['id'] = key;
        final lesson = NewsModel.fromJson(value);

        newsFromServer.add(lesson);
      });
    }

    return newsFromServer;
  }
}
