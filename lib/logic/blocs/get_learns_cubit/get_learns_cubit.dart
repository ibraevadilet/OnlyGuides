import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:only_guides/logic/models/learn_model.dart';

part 'get_learns_state.dart';
part 'get_learns_cubit.freezed.dart';

class GetLearnsCubit extends Cubit<GetLearnsState> {
  GetLearnsCubit() : super(const GetLearnsState.loading()) {
    getLearns();
  }

  Future<List<LearnModel>> getLearns() async {
    emit(const GetLearnsState.loading());
    try {
      final learns = await getLearnsFromServer();
      for (var i = 0; i < learns.length; i++) {
        if (i > 2) {
          learns[i].isPro = true;
        }
      }
      emit(GetLearnsState.success(learns));
      return learns;
    } catch (e) {
      emit(GetLearnsState.error(e.toString()));
      return [];
    }
  }

  Future<List<LearnModel>> getLearnsFromServer() async {
    final snapshot = await FirebaseDatabase.instance.ref('learn').get();

    final learnsFromServer = <LearnModel>[];
    if (snapshot.value != null) {
      final map = snapshot.value as Map<dynamic, dynamic>;

      map.forEach((key, value) {
        value['id'] = key;
        final lesson = LearnModel.fromJson(value);

        learnsFromServer.add(lesson);
      });
    }

    return learnsFromServer;
  }
}
