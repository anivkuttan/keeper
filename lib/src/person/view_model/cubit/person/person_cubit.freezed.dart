// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PersonCubitState {

 StateStatus get status; Person? get person; List<Person> get personList; Info? get info;
/// Create a copy of PersonCubitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PersonCubitStateCopyWith<PersonCubitState> get copyWith => _$PersonCubitStateCopyWithImpl<PersonCubitState>(this as PersonCubitState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PersonCubitState&&(identical(other.status, status) || other.status == status)&&(identical(other.person, person) || other.person == person)&&const DeepCollectionEquality().equals(other.personList, personList)&&(identical(other.info, info) || other.info == info));
}


@override
int get hashCode => Object.hash(runtimeType,status,person,const DeepCollectionEquality().hash(personList),info);

@override
String toString() {
  return 'PersonCubitState(status: $status, person: $person, personList: $personList, info: $info)';
}


}

/// @nodoc
abstract mixin class $PersonCubitStateCopyWith<$Res>  {
  factory $PersonCubitStateCopyWith(PersonCubitState value, $Res Function(PersonCubitState) _then) = _$PersonCubitStateCopyWithImpl;
@useResult
$Res call({
 StateStatus status, Person? person, List<Person> personList, Info? info
});




}
/// @nodoc
class _$PersonCubitStateCopyWithImpl<$Res>
    implements $PersonCubitStateCopyWith<$Res> {
  _$PersonCubitStateCopyWithImpl(this._self, this._then);

  final PersonCubitState _self;
  final $Res Function(PersonCubitState) _then;

/// Create a copy of PersonCubitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? person = freezed,Object? personList = null,Object? info = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,person: freezed == person ? _self.person : person // ignore: cast_nullable_to_non_nullable
as Person?,personList: null == personList ? _self.personList : personList // ignore: cast_nullable_to_non_nullable
as List<Person>,info: freezed == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as Info?,
  ));
}

}


/// @nodoc


class _PersonCubitState implements PersonCubitState {
  const _PersonCubitState({required this.status, this.person, final  List<Person> personList = const [], this.info}): _personList = personList;
  

@override final  StateStatus status;
@override final  Person? person;
 final  List<Person> _personList;
@override@JsonKey() List<Person> get personList {
  if (_personList is EqualUnmodifiableListView) return _personList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_personList);
}

@override final  Info? info;

/// Create a copy of PersonCubitState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PersonCubitStateCopyWith<_PersonCubitState> get copyWith => __$PersonCubitStateCopyWithImpl<_PersonCubitState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PersonCubitState&&(identical(other.status, status) || other.status == status)&&(identical(other.person, person) || other.person == person)&&const DeepCollectionEquality().equals(other._personList, _personList)&&(identical(other.info, info) || other.info == info));
}


@override
int get hashCode => Object.hash(runtimeType,status,person,const DeepCollectionEquality().hash(_personList),info);

@override
String toString() {
  return 'PersonCubitState(status: $status, person: $person, personList: $personList, info: $info)';
}


}

/// @nodoc
abstract mixin class _$PersonCubitStateCopyWith<$Res> implements $PersonCubitStateCopyWith<$Res> {
  factory _$PersonCubitStateCopyWith(_PersonCubitState value, $Res Function(_PersonCubitState) _then) = __$PersonCubitStateCopyWithImpl;
@override @useResult
$Res call({
 StateStatus status, Person? person, List<Person> personList, Info? info
});




}
/// @nodoc
class __$PersonCubitStateCopyWithImpl<$Res>
    implements _$PersonCubitStateCopyWith<$Res> {
  __$PersonCubitStateCopyWithImpl(this._self, this._then);

  final _PersonCubitState _self;
  final $Res Function(_PersonCubitState) _then;

/// Create a copy of PersonCubitState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? person = freezed,Object? personList = null,Object? info = freezed,}) {
  return _then(_PersonCubitState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,person: freezed == person ? _self.person : person // ignore: cast_nullable_to_non_nullable
as Person?,personList: null == personList ? _self._personList : personList // ignore: cast_nullable_to_non_nullable
as List<Person>,info: freezed == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as Info?,
  ));
}


}

// dart format on
