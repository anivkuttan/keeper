import 'dart:typed_data';

import 'package:drift/drift.dart' show Value;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:keeper/core/const/enums.dart';
import 'package:keeper/core/db/database.dart';
import 'package:keeper/core/di/di.dart';
import 'package:keeper/src/person/model/person.dart';
import 'package:keeper/src/shared/model/data_response.dart';
import 'package:phone_form_field/phone_form_field.dart';

part 'new_person_cubit.freezed.dart';
part 'new_person_cubit_state.dart';

class NewPersonCubit extends Cubit<NewPersonCubitState> {
  NewPersonCubit() : super(NewPersonCubitState(status: StateStatus.initial));

  void updatePerson({
    int? id,
    String? name,
    PhoneNumber? phoneNumber,
    String? email,
    Uint8List? profileImage,
    String? about,
    double? amount,
    String? password,
    bool? agreeToTerms,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? removeImage,
  }) {
    Person updatedPerson =
        state.person?.copyWith(
          removeImage: removeImage,
          id: id,
          name: name,
          phoneNumber: phoneNumber,
          email: email,
          password: password,
          amount: amount,
          agreeToTerms: agreeToTerms,
          profileImage: removeImage == true ? null : profileImage,
          about: about,
          createdAt: createdAt,
          updatedAt: updatedAt,
        ) ??
        Person(name: '');
    emit(state.copyWith(person: updatedPerson));
  }

  Future<void> createOnePerson() async {
    try {
      final db = getIt<AppDatabase>();
      final person = state.person!.toCompanian;
      await db
          .into(db.personTbl)
          .insert(
            person.copyWith(
              createdAt: Value(DateTime.now()),
              updatedAt: Value(DateTime.now()),
            ),
          );
      emit(
        state.copyWith(
          status: StateStatus.success,
          info: Info(message: "User created successfully"),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: StateStatus.failure,
          info: Info(message: "User created failed $e"),
        ),
      );
    }
  }

  Future<Person?> getPersonById(int id) async {
    try {
      final db = getIt<AppDatabase>();

      final person =
          await (db.select(db.personTbl)
            ..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

      return person;
    } catch (e) {
      return null;
    }
  }
}
