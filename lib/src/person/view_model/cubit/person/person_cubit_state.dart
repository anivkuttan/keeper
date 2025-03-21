part of 'person_cubit.dart';

@freezed
abstract class PersonCubitState with _$PersonCubitState {
  const factory PersonCubitState({
    required final StateStatus status,
    Person? person,
    @Default([]) List<Person> personList,
    final Info? info,
  }) = _PersonCubitState;
}
