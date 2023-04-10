import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:only_guides/logic/models/guide_model.dart';

part 'get_guides_state.dart';
part 'get_guides_cubit.freezed.dart';

class GetGuidesCubit extends Cubit<GetGuidesState> {
  GetGuidesCubit() : super(const GetGuidesState.loading()) {
    getGuides();
  }

  Future<List<GuideModel>> getGuides() async {
    emit(const GetGuidesState.loading());
    try {
      final guides = await getGuidesFromServer();
      for (var i = 0; i < guides.length; i++) {
        if (i > 2) {
          guides[i].isPro = true;
        }
      }
      emit(GetGuidesState.success(guides));
      return guides;
    } catch (e) {
      emit(GetGuidesState.error(e.toString()));
      return [];
    }
  }

  Future<List<GuideModel>> getGuidesFromServer() async {
    final snapshot = await FirebaseDatabase.instance.ref('guides').get();

    final guidesFromServer = <GuideModel>[];
    if (snapshot.value != null) {
      final map = snapshot.value as Map<dynamic, dynamic>;

      map.forEach((key, value) {
        value['id'] = key;
        final lesson = GuideModel.fromJson(value);

        guidesFromServer.add(lesson);
      });
    }

    return guidesFromServer;
  }
}
