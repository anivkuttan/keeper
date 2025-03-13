import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
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

 
  Future<void> createOnePerson() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      await Future.delayed(const Duration(seconds: 2)); 
      throw Exception("Failed to create user"); 
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
