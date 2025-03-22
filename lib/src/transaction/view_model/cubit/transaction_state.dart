part of 'transaction_cubit.dart';

@freezed
abstract class TransactionState with _$TransactionState {
  const factory TransactionState({
    required final StateStatus status,
    List<Person>? personList,
    @Default(Transaction()) Transaction transaction,
  }) = _TransactionState;
}
