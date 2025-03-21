part of 'new_person_cubit.dart';

@freezed
abstract class NewPersonCubitState with _$NewPersonCubitState {
  const factory NewPersonCubitState({
    required final StateStatus status,
    final Person? person,
    final Info? info,
  }) = _NewPersonCubitState;
}
