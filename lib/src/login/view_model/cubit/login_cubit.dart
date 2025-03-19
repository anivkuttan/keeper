import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:keeper/src/login/modal/repo/login_local.dart';
import 'package:keeper/src/person/model/person.dart';
import 'package:keeper/src/shared/model/data_response.dart';
import 'package:phone_form_field/phone_form_field.dart';

part 'login_cubit.freezed.dart';
part 'login_cubit_state.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  final LoginLocal _loginLocalRepo;
  LoginCubit(this._loginLocalRepo)
    : super(
        LoginCubitState(status: LoginStatus.initial, person: Person(name: '')),
      );

  Future<void> createOnePerson() async {
    if (state.person != null) {
      final person = state.person!;
      final response = await _loginLocalRepo.signUp(person);
      if (response.isSuccess) {
        emit(state.copyWith(status: LoginStatus.success, info: response.info));
      } else {
        emit(state.copyWith(status: LoginStatus.failure, info: response.info));
      }
    }
  }

  void updatePerson({
    int? id,
    String? name,
    PhoneNumber? phoneNumber,
    String? email,
    Uint8List? profileImage,
    String? about,
    double? amount,
    String? password,
    bool? agreeToTerms,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? removeImage,
  }) {
    Person updatedPerson =
        state.person?.copyWith(
          removeImage: removeImage,
          id: id,
          name: name,
          phoneNumber: phoneNumber,
          email: email,
          password: password,
          amount: amount,
          agreeToTerms: agreeToTerms,
          profileImage: removeImage == true ? null : profileImage,
          about: about,
          createdAt: createdAt,
          updatedAt: updatedAt,
        ) ??
        Person(name: '');
    emit(state.copyWith(person: updatedPerson));
  }
}
