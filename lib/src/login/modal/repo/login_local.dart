import 'package:drift/drift.dart';
import 'package:keeper/core/db/database.dart';
import 'package:keeper/src/login/modal/repo/login_repo.dart';
import 'package:keeper/src/person/model/person.dart';
import 'package:keeper/src/shared/model/data_response.dart';

class LoginLocal implements AuthRepo {
  final AppDatabase _db;
  LoginLocal(this._db);
  @override
  Future<DataResponse<void>> signIn(Person person) async {
    try {
      final phoneNumber = person.phoneNumber.nsn;

      final result =
          await (_db.select(_db.personTbl)..where((tbl) {
            return tbl.nsn.equals(phoneNumber);
          })).getSingleOrNull();

      if (result != null) {
        await saveLocalLoginStatus(result.id!);
        return DataResponse.success(
          info: Info(message: 'Successfully Signed In'),
        );
      } else {
        return DataResponse.failure(
          info: Info(message: 'Invalid phone number or password'),
        );
      }
    } catch (e) {
      return DataResponse.failure(info: Info(message: 'Something went wrong'));
    }
  }

  @override
  Future<DataResponse<void>> signUp(Person person) async {
    try {
      final phoneNumber = person.phoneNumber;
      final password = person.password ?? '';
      final name = person.name;
      final email = person.email;

      final existingUser =
          await (_db.select(
            _db.personTbl,
          )..where((tbl) => tbl.nsn.equals(phoneNumber.nsn))).getSingleOrNull();

      if (existingUser != null) {
        return DataResponse.failure(info: Info(message: 'User already exists'));
      }

      await _db
          .into(_db.personTbl)
          .insert(
            PersonTblCompanion.insert(
              name: name,
              email: Value(email),
              nsn: phoneNumber.nsn,
              isoCode: Value(phoneNumber.isoCode.name),
              countryCode: Value(phoneNumber.countryCode),
              password: Value(password),
            ),
          );

      return DataResponse.success(
        info: Info(message: 'Successfully Signed Up'),
      );
    } catch (e) {
      return DataResponse.failure(info: Info(message: 'Something went wrong'));
    }
  }

  @override
  Future<DataResponse<void>> signOut() async {
    throw UnimplementedError();
  }

  @override
  Future<bool> saveLocalLoginStatus(int id) async {
    try {
      final sharedDataList = await _db.select(_db.sharedData).get();

      if (sharedDataList.isNotEmpty) {
        await (_db.update(_db.sharedData)
          ..where((tbl) => tbl.id.equals(sharedDataList.first.id))).write(
          SharedDataCompanion(isLogined: Value(true), personId: Value(id)),
        );
        return true;
      } else {
        await _db
            .into(_db.sharedData)
            .insert(
              SharedDataCompanion(isLogined: Value(true), personId: Value(id)),
            );
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> isLogined() async {
    final sharedData = await _db.select(_db.sharedData).getSingleOrNull();
    if (sharedData != null) {
      final id = sharedData.id;
      print('SharedData ID: $id');
      return true;
    } else {
      print('SharedData is empty');
      return false;
    }
  }

  @override
  Future<bool> logOut() async {
    try {
      await _db.delete(_db.sharedData).go();
      return true;
    } catch (e) {
      return Future.value(false);
    }
  }
}
