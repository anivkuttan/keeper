import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:keeper/core/const/enums.dart';
import 'package:keeper/src/person/model/person.dart';
import 'package:keeper/src/shared/model/dropdown_type.dart';

part 'transaction_cubit.freezed.dart';
part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionState(status: StateStatus.initial));

  void updateTransaction({
    int? id,
    double? amount,
    DateTime? createdAt,
    DateTime? updatedAt,
    DropDownType? method,
    String? note,
    List<Uint8List>? attachmentList,
    List<Person>? personList,
  }) {
    emit(state.copyWith(status: StateStatus.update));
    final transaction = state.transaction.copyWith(
      amount: amount,
      attachmentList: attachmentList,
      createdAt: createdAt,
      method: method,
      note: note,
      updatedAt: updatedAt,
    );
    final emitState = state
        .copyWith(transaction: transaction)
        .copyWith(personList: personList, status: StateStatus.initial);
    emit(emitState);
  }
}
