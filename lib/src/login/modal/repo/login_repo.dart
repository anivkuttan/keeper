import 'package:keeper/src/person/model/person.dart';
import 'package:keeper/src/shared/model/data_response.dart';

abstract class AuthRepo {
  Future<DataResponse<void>> signIn(Person person);
  Future<DataResponse<void>> signUp(Person person);
  Future<DataResponse<void>> signOut();
  Future<bool> saveLocalLoginStatus(int id);
  Future<bool> isLogined();
  Future<bool> logOut();
}
