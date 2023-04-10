import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:only_guides/logic/models/preset_model.dart';

part 'get_presets_state.dart';
part 'get_presets_cubit.freezed.dart';

class GetPresetsCubit extends Cubit<GetPresetsState> {
  GetPresetsCubit() : super(const GetPresetsState.loading()) {
    getPresets();
  }

  Future<List<PresetModel>> getPresets() async {
    emit(const GetPresetsState.loading());
    try {
      final presets = await getPresetsFromServer();
      emit(GetPresetsState.success(presets));
      return presets;
    } catch (e) {
      emit(GetPresetsState.error(e.toString()));
      return [];
    }
  }

  Future<List<PresetModel>> getPresetsFromServer() async {
    final snapshot = await FirebaseDatabase.instance.ref('presets').get();

    final presetsFromServer = <PresetModel>[];
    if (snapshot.value != null) {
      final map = snapshot.value as Map<dynamic, dynamic>;

      map.forEach((key, value) {
        value['id'] = key;
        final lesson = PresetModel.fromJson(value);

        presetsFromServer.add(lesson);
      });
    }

    return presetsFromServer;
  }
}
