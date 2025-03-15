import 'package:equatable/equatable.dart';

import 'person.dart';

class PersonState extends Equatable {
  final Person? person;
  final List<Person> personList;
  final bool isLoading;
  final String? errorMessage;
  final bool isUserLoggedIn;

  const PersonState({
    this.person,
    this.personList = const [],
    this.isLoading = false,
    this.errorMessage,
    this.isUserLoggedIn = false,
  });

  @override
  List<Object?> get props => [
    person,
    personList,
    isLoading,
    errorMessage,
    isUserLoggedIn,
  ];

  PersonState copyWith({
    Person? person,
    List<Person>? personList,
    bool? isLoading,
    bool? isUserLoggedIn,
    String? errorMessage,
  }) {
    return PersonState(
      person: person ?? this.person,
      personList: personList ?? this.personList,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isUserLoggedIn: isUserLoggedIn ?? this.isUserLoggedIn,
    );
  }
}
