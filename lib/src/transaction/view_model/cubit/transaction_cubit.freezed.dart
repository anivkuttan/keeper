// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionState {

 StateStatus get status; List<Person>? get personList; Transaction get transaction;
/// Create a copy of TransactionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionStateCopyWith<TransactionState> get copyWith => _$TransactionStateCopyWithImpl<TransactionState>(this as TransactionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.personList, personList)&&(identical(other.transaction, transaction) || other.transaction == transaction));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(personList),transaction);

@override
String toString() {
  return 'TransactionState(status: $status, personList: $personList, transaction: $transaction)';
}


}

/// @nodoc
abstract mixin class $TransactionStateCopyWith<$Res>  {
  factory $TransactionStateCopyWith(TransactionState value, $Res Function(TransactionState) _then) = _$TransactionStateCopyWithImpl;
@useResult
$Res call({
 StateStatus status, List<Person>? personList, Transaction transaction
});




}
/// @nodoc
class _$TransactionStateCopyWithImpl<$Res>
    implements $TransactionStateCopyWith<$Res> {
  _$TransactionStateCopyWithImpl(this._self, this._then);

  final TransactionState _self;
  final $Res Function(TransactionState) _then;

/// Create a copy of TransactionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? personList = freezed,Object? transaction = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,personList: freezed == personList ? _self.personList : personList // ignore: cast_nullable_to_non_nullable
as List<Person>?,transaction: null == transaction ? _self.transaction : transaction // ignore: cast_nullable_to_non_nullable
as Transaction,
  ));
}

}


/// @nodoc


class _TransactionState implements TransactionState {
  const _TransactionState({required this.status, final  List<Person>? personList, this.transaction = const Transaction()}): _personList = personList;
  

@override final  StateStatus status;
 final  List<Person>? _personList;
@override List<Person>? get personList {
  final value = _personList;
  if (value == null) return null;
  if (_personList is EqualUnmodifiableListView) return _personList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey() final  Transaction transaction;

/// Create a copy of TransactionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionStateCopyWith<_TransactionState> get copyWith => __$TransactionStateCopyWithImpl<_TransactionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._personList, _personList)&&(identical(other.transaction, transaction) || other.transaction == transaction));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_personList),transaction);

@override
String toString() {
  return 'TransactionState(status: $status, personList: $personList, transaction: $transaction)';
}


}

/// @nodoc
abstract mixin class _$TransactionStateCopyWith<$Res> implements $TransactionStateCopyWith<$Res> {
  factory _$TransactionStateCopyWith(_TransactionState value, $Res Function(_TransactionState) _then) = __$TransactionStateCopyWithImpl;
@override @useResult
$Res call({
 StateStatus status, List<Person>? personList, Transaction transaction
});




}
/// @nodoc
class __$TransactionStateCopyWithImpl<$Res>
    implements _$TransactionStateCopyWith<$Res> {
  __$TransactionStateCopyWithImpl(this._self, this._then);

  final _TransactionState _self;
  final $Res Function(_TransactionState) _then;

/// Create a copy of TransactionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? personList = freezed,Object? transaction = null,}) {
  return _then(_TransactionState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,personList: freezed == personList ? _self._personList : personList // ignore: cast_nullable_to_non_nullable
as List<Person>?,transaction: null == transaction ? _self.transaction : transaction // ignore: cast_nullable_to_non_nullable
as Transaction,
  ));
}


}

// dart format on
