import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeper/core/db/database.dart';
import 'package:keeper/core/di/di.dart';
import 'package:keeper/src/person/model/person.dart';
import 'package:keeper/src/person/model/person_state.dart';
import 'package:phone_form_field/phone_form_field.dart';

class PersonViewModel extends StateNotifier<PersonState> {
  PersonViewModel() : super(PersonState()) {
    checkUserLoginStatus();
  }
  Future<void> checkUserLoginStatus() async {
    final isLoggedIn = await isAnyUserLoggedIn();

    state = state.copyWith(isUserLoggedIn: isLoggedIn);
  }

  Future<AppResponse<bool>> createOnePerson() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
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
      state = state.copyWith(isLoading: false);
      return AppResponse<bool>(data: true, message: "Login Successfully");
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
      log(e.toString());
      return AppResponse<bool>(data: false, message: e.toString());
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

  Future<void> getAllPersons() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final db = getIt<AppDatabase>();

      final personList = await db.select(db.personTbl).get();
      state = state.copyWith(
        personList: personList,
        isLoading: false,
        errorMessage: null,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<bool> logOut() async {
    try {
      final db = getIt<AppDatabase>();

      await db
          .update(db.sharedData)
          .write(
            SharedDataCompanion(isLogined: Value(false), personId: Value(null)),
          );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> isAnyUserLoggedIn() async {
    try {
      final db = getIt<AppDatabase>();

      final sharedData = await db.select(db.sharedData).getSingleOrNull();

      return sharedData?.isLogined ?? false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> logIn() async {
    String phoneNumber = state.person?.phoneNumber.nsn ?? '';
    String password = state.person?.password ?? "";
    try {
      final db = getIt<AppDatabase>();

      final user =
          await (db.select(db.personTbl)..where(
            (tbl) => tbl.email.equals(phoneNumber) & tbl.password.equals(password),
          )).getSingleOrNull();

      if (user == null) {
        state = state.copyWith(errorMessage: "User Not Fount please sign-in");
        return false;
      }

      final sharedData = await db.select(db.sharedData).getSingleOrNull();

      if (sharedData == null) {
        await db
            .into(db.sharedData)
            .insert(
              SharedDataCompanion(
                isLogined: Value(true),
                personId: Value(user.id),
              ),
            );
      } else {
        await db
            .update(db.sharedData)
            .write(
              SharedDataCompanion(
                isLogined: Value(true),
                personId: Value(user.id),
              ),
            );
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  void updatePerson({
    String? name,
    PhoneNumber? phoneNumber,
    String? email,
    Uint8List? imageUrl,
    double? owedAmount,
    String? password,
    bool? removeImage,
  }) {
    state = state.copyWith(
      person:
          state.person?.copyWith(
            name: name,
            phoneNumber: phoneNumber,
            email: email,
            profileImage: imageUrl,
            amount: owedAmount,
            password: password,
            removeImage: removeImage,
          ) ??
          Person(
            name: name ?? '',
            phoneNumber: const PhoneNumber(isoCode: IsoCode.IN, nsn: ''),
            email: email,
            profileImage: imageUrl,
            amount: owedAmount ?? 0.0,
            password: password,
          ),
    );
  }
}

final personProvider = StateNotifierProvider<PersonViewModel, PersonState>(
  (ref) => PersonViewModel(),
);

final class AppResponse<T> {
  final String? message;
  final T? data;
  const AppResponse({this.message, this.data});
}
