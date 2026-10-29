// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plant_draft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlantDraft {

 String get nickname; String get speciesId; PlantLocation get location; String? get notes;
/// Create a copy of PlantDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlantDraftCopyWith<PlantDraft> get copyWith => _$PlantDraftCopyWithImpl<PlantDraft>(this as PlantDraft, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PlantDraft;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlantDraft&&(identical(other.nickname, _this.nickname) || other.nickname == _this.nickname)&&(identical(other.speciesId, _this.speciesId) || other.speciesId == _this.speciesId)&&(identical(other.location, _this.location) || other.location == _this.location)&&(identical(other.notes, _this.notes) || other.notes == _this.notes));
}


@override
int get hashCode {
  final _this = this as PlantDraft;
  return Object.hash(runtimeType,_this.nickname,_this.speciesId,_this.location,_this.notes);
}

@override
String toString() {
  final _this = this as PlantDraft;
  return 'PlantDraft(nickname: ${_this.nickname}, speciesId: ${_this.speciesId}, location: ${_this.location}, notes: ${_this.notes})';
}


}

/// @nodoc
abstract mixin class $PlantDraftCopyWith<$Res>  {
  factory $PlantDraftCopyWith(PlantDraft value, $Res Function(PlantDraft) _then) = _$PlantDraftCopyWithImpl;
@useResult
$Res call({
 String nickname, String speciesId, PlantLocation location, String? notes
});




}
/// @nodoc
class _$PlantDraftCopyWithImpl<$Res>
    implements $PlantDraftCopyWith<$Res> {
  _$PlantDraftCopyWithImpl(this._self, this._then);

  final PlantDraft _self;
  final $Res Function(PlantDraft) _then;

/// Create a copy of PlantDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nickname = null,Object? speciesId = null,Object? location = null,Object? notes = freezed,}) {
  return _then(PlantDraft(
nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,speciesId: null == speciesId ? _self.speciesId : speciesId // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as PlantLocation,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PlantDraft].
extension PlantDraftPatterns on PlantDraft {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlantDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlantDraft() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlantDraft value)  $default,){
final _that = this;
switch (_that) {
case _PlantDraft():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlantDraft value)?  $default,){
final _that = this;
switch (_that) {
case _PlantDraft() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String nickname,  String speciesId,  PlantLocation location,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlantDraft() when $default != null:
return $default(_that.nickname,_that.speciesId,_that.location,_that.notes);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String nickname,  String speciesId,  PlantLocation location,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _PlantDraft():
return $default(_that.nickname,_that.speciesId,_that.location,_that.notes);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String nickname,  String speciesId,  PlantLocation location,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _PlantDraft() when $default != null:
return $default(_that.nickname,_that.speciesId,_that.location,_that.notes);case _:
  return null;

}
}

}

/// @nodoc


class _PlantDraft implements PlantDraft {
  const _PlantDraft({required this.nickname, required this.speciesId, required this.location, this.notes});
  

@override final  String nickname;
@override final  String speciesId;
@override final  PlantLocation location;
@override final  String? notes;

/// Create a copy of PlantDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlantDraftCopyWith<_PlantDraft> get copyWith => __$PlantDraftCopyWithImpl<_PlantDraft>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlantDraft&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.speciesId, speciesId) || other.speciesId == speciesId)&&(identical(other.location, location) || other.location == location)&&(identical(other.notes, notes) || other.notes == notes));
}


@override
int get hashCode {
    return Object.hash(runtimeType,nickname,speciesId,location,notes);
}

@override
String toString() {
    return 'PlantDraft(nickname: $nickname, speciesId: $speciesId, location: $location, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$PlantDraftCopyWith<$Res> implements $PlantDraftCopyWith<$Res> {
  factory _$PlantDraftCopyWith(_PlantDraft value, $Res Function(_PlantDraft) _then) = __$PlantDraftCopyWithImpl;
@override @useResult
$Res call({
 String nickname, String speciesId, PlantLocation location, String? notes
});




}
/// @nodoc
class __$PlantDraftCopyWithImpl<$Res>
    implements _$PlantDraftCopyWith<$Res> {
  __$PlantDraftCopyWithImpl(this._self, this._then);

  final _PlantDraft _self;
  final $Res Function(_PlantDraft) _then;

/// Create a copy of PlantDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nickname = null,Object? speciesId = null,Object? location = null,Object? notes = freezed,}) {
  return _then(_PlantDraft(
nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,speciesId: null == speciesId ? _self.speciesId : speciesId // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as PlantLocation,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
