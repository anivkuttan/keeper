// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_person_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NewPersonCubitState {

 StateStatus get status; Person? get person; Info? get info;
/// Create a copy of NewPersonCubitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewPersonCubitStateCopyWith<NewPersonCubitState> get copyWith => _$NewPersonCubitStateCopyWithImpl<NewPersonCubitState>(this as NewPersonCubitState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewPersonCubitState&&(identical(other.status, status) || other.status == status)&&(identical(other.person, person) || other.person == person)&&(identical(other.info, info) || other.info == info));
}


@override
int get hashCode => Object.hash(runtimeType,status,person,info);

@override
String toString() {
  return 'NewPersonCubitState(status: $status, person: $person, info: $info)';
}


}

/// @nodoc
abstract mixin class $NewPersonCubitStateCopyWith<$Res>  {
  factory $NewPersonCubitStateCopyWith(NewPersonCubitState value, $Res Function(NewPersonCubitState) _then) = _$NewPersonCubitStateCopyWithImpl;
@useResult
$Res call({
 StateStatus status, Person? person, Info? info
});




}
/// @nodoc
class _$NewPersonCubitStateCopyWithImpl<$Res>
    implements $NewPersonCubitStateCopyWith<$Res> {
  _$NewPersonCubitStateCopyWithImpl(this._self, this._then);

  final NewPersonCubitState _self;
  final $Res Function(NewPersonCubitState) _then;

/// Create a copy of NewPersonCubitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? person = freezed,Object? info = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,person: freezed == person ? _self.person : person // ignore: cast_nullable_to_non_nullable
as Person?,info: freezed == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as Info?,
  ));
}

}


/// @nodoc


class _NewPersonCubitState implements NewPersonCubitState {
  const _NewPersonCubitState({required this.status, this.person, this.info});
  

@override final  StateStatus status;
@override final  Person? person;
@override final  Info? info;

/// Create a copy of NewPersonCubitState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewPersonCubitStateCopyWith<_NewPersonCubitState> get copyWith => __$NewPersonCubitStateCopyWithImpl<_NewPersonCubitState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewPersonCubitState&&(identical(other.status, status) || other.status == status)&&(identical(other.person, person) || other.person == person)&&(identical(other.info, info) || other.info == info));
}


@override
int get hashCode => Object.hash(runtimeType,status,person,info);

@override
String toString() {
  return 'NewPersonCubitState(status: $status, person: $person, info: $info)';
}


}

/// @nodoc
abstract mixin class _$NewPersonCubitStateCopyWith<$Res> implements $NewPersonCubitStateCopyWith<$Res> {
  factory _$NewPersonCubitStateCopyWith(_NewPersonCubitState value, $Res Function(_NewPersonCubitState) _then) = __$NewPersonCubitStateCopyWithImpl;
@override @useResult
$Res call({
 StateStatus status, Person? person, Info? info
});




}
/// @nodoc
class __$NewPersonCubitStateCopyWithImpl<$Res>
    implements _$NewPersonCubitStateCopyWith<$Res> {
  __$NewPersonCubitStateCopyWithImpl(this._self, this._then);

  final _NewPersonCubitState _self;
  final $Res Function(_NewPersonCubitState) _then;

/// Create a copy of NewPersonCubitState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? person = freezed,Object? info = freezed,}) {
  return _then(_NewPersonCubitState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,person: freezed == person ? _self.person : person // ignore: cast_nullable_to_non_nullable
as Person?,info: freezed == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as Info?,
  ));
}


}

// dart format on
