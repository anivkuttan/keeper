import 'person.dart';

class PersonState {
  final Person? person;
  final bool isLoading;
  final String? errorMessage;

  PersonState({this.person, this.isLoading = false, this.errorMessage});

  PersonState copyWith({Person? person, bool? isLoading, String? errorMessage}) {
    return PersonState(
      person: person ?? this.person,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}
