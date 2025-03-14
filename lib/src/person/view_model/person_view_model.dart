import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeper/core/db/database.dart';
import 'package:keeper/core/di/di.dart';
import 'package:keeper/src/person/model/person.dart';
import 'package:keeper/src/person/model/person_state.dart';

class PersonViewModel extends StateNotifier<PersonState> {
  PersonViewModel() : super(PersonState());
  // final nameController = TextEditingController();

  // final contactController = TextEditingController();

  // final emailController = TextEditingController();

  // final imageController = TextEditingController();

  // final amountController = TextEditingController();

  // @override
  // void dispose() {
  //   nameController.dispose();
  //   contactController.dispose();
  //   emailController.dispose();
  //   imageController.dispose();
  //   amountController.dispose();
  //   super.dispose();
  // }

  Future<bool> createOnePerson() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final db = getIt<AppDatabase>();
      final person = state.person!.toCompanian;
      await db
          .into(db.personTbl)
          .insert(
            person.copyWith(
              createdAt: Value(DateTime.now()),
              updatedAt: Value(DateTime.now()),
            ),
          );
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
      return false;
    }
  }

  Future<void> getAllPersons() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final db = getIt<AppDatabase>();

      final personList = await db.select(db.personTbl).get();
      state = state.copyWith(
        personList: personList,
        isLoading: false,
        errorMessage: null,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  void updatePerson({
    String? name,
    String? contactNumber,
    String? email,
    Uint8List? imageUrl,
    double? owedAmount,
  }) {
    state = state.copyWith(
      person:
          state.person?.copyWith(
            name: name,
            contactNumber: contactNumber,
            email: email,
            imageUrl: imageUrl,
            owedAmount: owedAmount,
          ) ??
          Person(
            name: name ?? '',
            contactNumber: contactNumber ?? '',
            email: email,
            imageUrl: imageUrl,
            owedAmount: owedAmount ?? 0.0,
          ),
    );
  }
}

final personProvider = StateNotifierProvider<PersonViewModel, PersonState>(
  (ref) => PersonViewModel(),
  // {
  //   final viewModel = PersonViewModel();

  //   ref.onDispose(() => viewModel.dispose());

  //   return viewModel;
  // }
);
