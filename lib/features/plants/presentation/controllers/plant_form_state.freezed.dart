// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plant_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlantFormState {

 List<Species> get species; String get nickname; PlantLocation get location; bool get isSaving; Map<ValidationField, ValidationProblem> get fieldErrors; bool get removePhoto; Plant? get original; String? get speciesId; String? get notes; String? get existingPhotoPath; String? get pickedPhotoPath; Failure? get loadFailure; Failure? get saveFailure;
/// Create a copy of PlantFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlantFormStateCopyWith<PlantFormState> get copyWith => _$PlantFormStateCopyWithImpl<PlantFormState>(this as PlantFormState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PlantFormState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlantFormState&&const DeepCollectionEquality().equals(other.species, _this.species)&&(identical(other.nickname, _this.nickname) || other.nickname == _this.nickname)&&(identical(other.location, _this.location) || other.location == _this.location)&&(identical(other.isSaving, _this.isSaving) || other.isSaving == _this.isSaving)&&const DeepCollectionEquality().equals(other.fieldErrors, _this.fieldErrors)&&(identical(other.removePhoto, _this.removePhoto) || other.removePhoto == _this.removePhoto)&&(identical(other.original, _this.original) || other.original == _this.original)&&(identical(other.speciesId, _this.speciesId) || other.speciesId == _this.speciesId)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&(identical(other.existingPhotoPath, _this.existingPhotoPath) || other.existingPhotoPath == _this.existingPhotoPath)&&(identical(other.pickedPhotoPath, _this.pickedPhotoPath) || other.pickedPhotoPath == _this.pickedPhotoPath)&&(identical(other.loadFailure, _this.loadFailure) || other.loadFailure == _this.loadFailure)&&(identical(other.saveFailure, _this.saveFailure) || other.saveFailure == _this.saveFailure));
}


@override
int get hashCode {
  final _this = this as PlantFormState;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.species),_this.nickname,_this.location,_this.isSaving,const DeepCollectionEquality().hash(_this.fieldErrors),_this.removePhoto,_this.original,_this.speciesId,_this.notes,_this.existingPhotoPath,_this.pickedPhotoPath,_this.loadFailure,_this.saveFailure);
}

@override
String toString() {
  final _this = this as PlantFormState;
  return 'PlantFormState(species: ${_this.species}, nickname: ${_this.nickname}, location: ${_this.location}, isSaving: ${_this.isSaving}, fieldErrors: ${_this.fieldErrors}, removePhoto: ${_this.removePhoto}, original: ${_this.original}, speciesId: ${_this.speciesId}, notes: ${_this.notes}, existingPhotoPath: ${_this.existingPhotoPath}, pickedPhotoPath: ${_this.pickedPhotoPath}, loadFailure: ${_this.loadFailure}, saveFailure: ${_this.saveFailure})';
}


}

/// @nodoc
abstract mixin class $PlantFormStateCopyWith<$Res>  {
  factory $PlantFormStateCopyWith(PlantFormState value, $Res Function(PlantFormState) _then) = _$PlantFormStateCopyWithImpl;
@useResult
$Res call({
 List<Species> species, String nickname, PlantLocation location, bool isSaving, Map<ValidationField, ValidationProblem> fieldErrors, bool removePhoto, Plant? original, String? speciesId, String? notes, String? existingPhotoPath, String? pickedPhotoPath, Failure? loadFailure, Failure? saveFailure
});


$PlantCopyWith<$Res>? get original;

}
/// @nodoc
class _$PlantFormStateCopyWithImpl<$Res>
    implements $PlantFormStateCopyWith<$Res> {
  _$PlantFormStateCopyWithImpl(this._self, this._then);

  final PlantFormState _self;
  final $Res Function(PlantFormState) _then;

/// Create a copy of PlantFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? species = null,Object? nickname = null,Object? location = null,Object? isSaving = null,Object? fieldErrors = null,Object? removePhoto = null,Object? original = freezed,Object? speciesId = freezed,Object? notes = freezed,Object? existingPhotoPath = freezed,Object? pickedPhotoPath = freezed,Object? loadFailure = freezed,Object? saveFailure = freezed,}) {
  return _then(PlantFormState(
species: null == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as List<Species>,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as PlantLocation,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,fieldErrors: null == fieldErrors ? _self.fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as Map<ValidationField, ValidationProblem>,removePhoto: null == removePhoto ? _self.removePhoto : removePhoto // ignore: cast_nullable_to_non_nullable
as bool,original: freezed == original ? _self.original : original // ignore: cast_nullable_to_non_nullable
as Plant?,speciesId: freezed == speciesId ? _self.speciesId : speciesId // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,existingPhotoPath: freezed == existingPhotoPath ? _self.existingPhotoPath : existingPhotoPath // ignore: cast_nullable_to_non_nullable
as String?,pickedPhotoPath: freezed == pickedPhotoPath ? _self.pickedPhotoPath : pickedPhotoPath // ignore: cast_nullable_to_non_nullable
as String?,loadFailure: freezed == loadFailure ? _self.loadFailure : loadFailure // ignore: cast_nullable_to_non_nullable
as Failure?,saveFailure: freezed == saveFailure ? _self.saveFailure : saveFailure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}
/// Create a copy of PlantFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlantCopyWith<$Res>? get original {
    if (_self.original == null) {
    return null;
  }

  return $PlantCopyWith<$Res>(_self.original!, (value) {
    return _then(_self.copyWith(original: value));
  });
}
}


/// Adds pattern-matching-related methods to [PlantFormState].
extension PlantFormStatePatterns on PlantFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlantFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlantFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlantFormState value)  $default,){
final _that = this;
switch (_that) {
case _PlantFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlantFormState value)?  $default,){
final _that = this;
switch (_that) {
case _PlantFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Species> species,  String nickname,  PlantLocation location,  bool isSaving,  Map<ValidationField, ValidationProblem> fieldErrors,  bool removePhoto,  Plant? original,  String? speciesId,  String? notes,  String? existingPhotoPath,  String? pickedPhotoPath,  Failure? loadFailure,  Failure? saveFailure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlantFormState() when $default != null:
return $default(_that.species,_that.nickname,_that.location,_that.isSaving,_that.fieldErrors,_that.removePhoto,_that.original,_that.speciesId,_that.notes,_that.existingPhotoPath,_that.pickedPhotoPath,_that.loadFailure,_that.saveFailure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Species> species,  String nickname,  PlantLocation location,  bool isSaving,  Map<ValidationField, ValidationProblem> fieldErrors,  bool removePhoto,  Plant? original,  String? speciesId,  String? notes,  String? existingPhotoPath,  String? pickedPhotoPath,  Failure? loadFailure,  Failure? saveFailure)  $default,) {final _that = this;
switch (_that) {
case _PlantFormState():
return $default(_that.species,_that.nickname,_that.location,_that.isSaving,_that.fieldErrors,_that.removePhoto,_that.original,_that.speciesId,_that.notes,_that.existingPhotoPath,_that.pickedPhotoPath,_that.loadFailure,_that.saveFailure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Species> species,  String nickname,  PlantLocation location,  bool isSaving,  Map<ValidationField, ValidationProblem> fieldErrors,  bool removePhoto,  Plant? original,  String? speciesId,  String? notes,  String? existingPhotoPath,  String? pickedPhotoPath,  Failure? loadFailure,  Failure? saveFailure)?  $default,) {final _that = this;
switch (_that) {
case _PlantFormState() when $default != null:
return $default(_that.species,_that.nickname,_that.location,_that.isSaving,_that.fieldErrors,_that.removePhoto,_that.original,_that.speciesId,_that.notes,_that.existingPhotoPath,_that.pickedPhotoPath,_that.loadFailure,_that.saveFailure);case _:
  return null;

}
}

}

/// @nodoc


class _PlantFormState extends PlantFormState {
  const _PlantFormState({required  List<Species> species, required this.nickname, required this.location, required this.isSaving,  Map<ValidationField, ValidationProblem> fieldErrors = const {}, this.removePhoto = false, this.original, this.speciesId, this.notes, this.existingPhotoPath, this.pickedPhotoPath, this.loadFailure, this.saveFailure}): _species = species,_fieldErrors = fieldErrors,super._();
  

 final  List<Species> _species;
@override List<Species> get species {
  if (_species is EqualUnmodifiableListView) return _species;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_species);
}

@override final  String nickname;
@override final  PlantLocation location;
@override final  bool isSaving;
 final  Map<ValidationField, ValidationProblem> _fieldErrors;
@override@JsonKey() Map<ValidationField, ValidationProblem> get fieldErrors {
  if (_fieldErrors is EqualUnmodifiableMapView) return _fieldErrors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_fieldErrors);
}

@override@JsonKey() final  bool removePhoto;
@override final  Plant? original;
@override final  String? speciesId;
@override final  String? notes;
@override final  String? existingPhotoPath;
@override final  String? pickedPhotoPath;
@override final  Failure? loadFailure;
@override final  Failure? saveFailure;

/// Create a copy of PlantFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlantFormStateCopyWith<_PlantFormState> get copyWith => __$PlantFormStateCopyWithImpl<_PlantFormState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlantFormState&&const DeepCollectionEquality().equals(other.species, _species)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.location, location) || other.location == location)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&const DeepCollectionEquality().equals(other.fieldErrors, _fieldErrors)&&(identical(other.removePhoto, removePhoto) || other.removePhoto == removePhoto)&&(identical(other.original, original) || other.original == original)&&(identical(other.speciesId, speciesId) || other.speciesId == speciesId)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.existingPhotoPath, existingPhotoPath) || other.existingPhotoPath == existingPhotoPath)&&(identical(other.pickedPhotoPath, pickedPhotoPath) || other.pickedPhotoPath == pickedPhotoPath)&&(identical(other.loadFailure, loadFailure) || other.loadFailure == loadFailure)&&(identical(other.saveFailure, saveFailure) || other.saveFailure == saveFailure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_species),nickname,location,isSaving,const DeepCollectionEquality().hash(_fieldErrors),removePhoto,original,speciesId,notes,existingPhotoPath,pickedPhotoPath,loadFailure,saveFailure);
}

@override
String toString() {
    return 'PlantFormState(species: $species, nickname: $nickname, location: $location, isSaving: $isSaving, fieldErrors: $fieldErrors, removePhoto: $removePhoto, original: $original, speciesId: $speciesId, notes: $notes, existingPhotoPath: $existingPhotoPath, pickedPhotoPath: $pickedPhotoPath, loadFailure: $loadFailure, saveFailure: $saveFailure)';
}


}

/// @nodoc
abstract mixin class _$PlantFormStateCopyWith<$Res> implements $PlantFormStateCopyWith<$Res> {
  factory _$PlantFormStateCopyWith(_PlantFormState value, $Res Function(_PlantFormState) _then) = __$PlantFormStateCopyWithImpl;
@override @useResult
$Res call({
 List<Species> species, String nickname, PlantLocation location, bool isSaving, Map<ValidationField, ValidationProblem> fieldErrors, bool removePhoto, Plant? original, String? speciesId, String? notes, String? existingPhotoPath, String? pickedPhotoPath, Failure? loadFailure, Failure? saveFailure
});


@override $PlantCopyWith<$Res>? get original;

}
/// @nodoc
class __$PlantFormStateCopyWithImpl<$Res>
    implements _$PlantFormStateCopyWith<$Res> {
  __$PlantFormStateCopyWithImpl(this._self, this._then);

  final _PlantFormState _self;
  final $Res Function(_PlantFormState) _then;

/// Create a copy of PlantFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? species = null,Object? nickname = null,Object? location = null,Object? isSaving = null,Object? fieldErrors = null,Object? removePhoto = null,Object? original = freezed,Object? speciesId = freezed,Object? notes = freezed,Object? existingPhotoPath = freezed,Object? pickedPhotoPath = freezed,Object? loadFailure = freezed,Object? saveFailure = freezed,}) {
  return _then(_PlantFormState(
species: null == species ? _self._species : species // ignore: cast_nullable_to_non_nullable
as List<Species>,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as PlantLocation,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,fieldErrors: null == fieldErrors ? _self._fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as Map<ValidationField, ValidationProblem>,removePhoto: null == removePhoto ? _self.removePhoto : removePhoto // ignore: cast_nullable_to_non_nullable
as bool,original: freezed == original ? _self.original : original // ignore: cast_nullable_to_non_nullable
as Plant?,speciesId: freezed == speciesId ? _self.speciesId : speciesId // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,existingPhotoPath: freezed == existingPhotoPath ? _self.existingPhotoPath : existingPhotoPath // ignore: cast_nullable_to_non_nullable
as String?,pickedPhotoPath: freezed == pickedPhotoPath ? _self.pickedPhotoPath : pickedPhotoPath // ignore: cast_nullable_to_non_nullable
as String?,loadFailure: freezed == loadFailure ? _self.loadFailure : loadFailure // ignore: cast_nullable_to_non_nullable
as Failure?,saveFailure: freezed == saveFailure ? _self.saveFailure : saveFailure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of PlantFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlantCopyWith<$Res>? get original {
    if (_self.original == null) {
    return null;
  }

  return $PlantCopyWith<$Res>(_self.original!, (value) {
    return _then(_self.copyWith(original: value));
  });
}
}

// dart format on
