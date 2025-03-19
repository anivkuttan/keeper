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
    throw UnimplementedError();
  }

  @override
  Future<DataResponse<void>> signOut() async {
    throw UnimplementedError();
  }

  @override
  Future<DataResponse<void>> signUp(Person person) async {
    try {
      final phoneNumber = person.phoneNumber.international;
      final password = person.password ?? '';
      await (_db.select(_db.personTbl)..where(
        (tbl) => Expression.and([
          tbl.phoneNumber.equals(phoneNumber),
          tbl.password.equals(password),
        ]),
      )).getSingleOrNull();
      return DataResponse.success(info: Info(message: 'Successfully SigUp'));
    } catch (e) {
      return DataResponse.failure(info: Info(message: 'Something went worng'));
    }
  }
}
