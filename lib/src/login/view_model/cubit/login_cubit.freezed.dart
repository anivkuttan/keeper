// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginCubitState {

 LoginStatus get status; Person? get person; Info? get info;
/// Create a copy of LoginCubitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginCubitStateCopyWith<LoginCubitState> get copyWith => _$LoginCubitStateCopyWithImpl<LoginCubitState>(this as LoginCubitState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginCubitState&&(identical(other.status, status) || other.status == status)&&(identical(other.person, person) || other.person == person)&&(identical(other.info, info) || other.info == info));
}


@override
int get hashCode => Object.hash(runtimeType,status,person,info);

@override
String toString() {
  return 'LoginCubitState(status: $status, person: $person, info: $info)';
}


}

/// @nodoc
abstract mixin class $LoginCubitStateCopyWith<$Res>  {
  factory $LoginCubitStateCopyWith(LoginCubitState value, $Res Function(LoginCubitState) _then) = _$LoginCubitStateCopyWithImpl;
@useResult
$Res call({
 LoginStatus status, Person? person, Info? info
});




}
/// @nodoc
class _$LoginCubitStateCopyWithImpl<$Res>
    implements $LoginCubitStateCopyWith<$Res> {
  _$LoginCubitStateCopyWithImpl(this._self, this._then);

  final LoginCubitState _self;
  final $Res Function(LoginCubitState) _then;

/// Create a copy of LoginCubitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? person = freezed,Object? info = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LoginStatus,person: freezed == person ? _self.person : person // ignore: cast_nullable_to_non_nullable
as Person?,info: freezed == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as Info?,
  ));
}

}


/// @nodoc


class _LoginCubitState implements LoginCubitState {
  const _LoginCubitState({required this.status, this.person, this.info});
  

@override final  LoginStatus status;
@override final  Person? person;
@override final  Info? info;

/// Create a copy of LoginCubitState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginCubitStateCopyWith<_LoginCubitState> get copyWith => __$LoginCubitStateCopyWithImpl<_LoginCubitState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginCubitState&&(identical(other.status, status) || other.status == status)&&(identical(other.person, person) || other.person == person)&&(identical(other.info, info) || other.info == info));
}


@override
int get hashCode => Object.hash(runtimeType,status,person,info);

@override
String toString() {
  return 'LoginCubitState(status: $status, person: $person, info: $info)';
}


}

/// @nodoc
abstract mixin class _$LoginCubitStateCopyWith<$Res> implements $LoginCubitStateCopyWith<$Res> {
  factory _$LoginCubitStateCopyWith(_LoginCubitState value, $Res Function(_LoginCubitState) _then) = __$LoginCubitStateCopyWithImpl;
@override @useResult
$Res call({
 LoginStatus status, Person? person, Info? info
});




}
/// @nodoc
class __$LoginCubitStateCopyWithImpl<$Res>
    implements _$LoginCubitStateCopyWith<$Res> {
  __$LoginCubitStateCopyWithImpl(this._self, this._then);

  final _LoginCubitState _self;
  final $Res Function(_LoginCubitState) _then;

/// Create a copy of LoginCubitState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? person = freezed,Object? info = freezed,}) {
  return _then(_LoginCubitState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LoginStatus,person: freezed == person ? _self.person : person // ignore: cast_nullable_to_non_nullable
as Person?,info: freezed == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as Info?,
  ));
}


}

// dart format on
