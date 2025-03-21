import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:keeper/core/const/enums.dart';
import 'package:keeper/core/db/database.dart';
import 'package:keeper/src/person/model/person.dart';
import 'package:keeper/src/shared/model/data_response.dart';

part 'person_cubit.freezed.dart';
part 'person_cubit_state.dart';

class PersonCubit extends Cubit<PersonCubitState> {
  final AppDatabase _db;
  PersonCubit(this._db) : super(PersonCubitState(status: StateStatus.initial));

  Future<void> getAllPersons() async {
    try {
      emit(state.copyWith(status: StateStatus.loading));
      final personList = await (_db.select(_db.personTbl)).get();
      final emitState = state.copyWith(
        personList: personList,
        status: StateStatus.success,
        info: Info(message: "Person list fetch successfully"),
      );
      emit(emitState);
    } catch (e) {
      emit(
        state.copyWith(
          info: Info(message: 'Person list fetched failed'),
          status: StateStatus.failure,
        ),
      );
    }
  }
}
