import 'package:equatable/equatable.dart';

import 'person.dart';

class PersonState extends Equatable {
  final Person? person;
  final List<Person> personList;
  final bool isLoading;
  final String? errorMessage;

  const PersonState({
    this.person,
    this.personList = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [person, personList, isLoading, errorMessage];

  PersonState copyWith({
    Person? person,
    List<Person>? personList,
    bool? isLoading,
    String? errorMessage,
  }) {
    return PersonState(
      person: person ?? this.person,
      personList: personList ?? this.personList,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
