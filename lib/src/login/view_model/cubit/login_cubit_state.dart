part of 'login_cubit.dart';

@freezed
abstract class LoginCubitState with _$LoginCubitState {
  const factory LoginCubitState({
    required StateStatus status,
    Person? person,
    Info? info,
  }) = _LoginCubitState;
}
