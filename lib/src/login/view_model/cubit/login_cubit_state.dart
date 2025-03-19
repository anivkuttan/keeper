part of 'login_cubit.dart';

@freezed
abstract class LoginCubitState with _$LoginCubitState {
  const factory LoginCubitState({
    required LoginStatus status,
    Person? person,
    Info? info,
  }) = _LoginCubitState;
}

enum LoginStatus { initial, loading, success, failure }
