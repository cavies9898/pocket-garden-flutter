// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'species.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Species {

 String get id; String get commonNameEn; String get commonNameEs; String get scientificName; String get descriptionEn; String get descriptionEs; int get wateringFrequencyDays; int get fertilizingFrequencyDays; LightRequirement get lightRequirement;
/// Create a copy of Species
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpeciesCopyWith<Species> get copyWith => _$SpeciesCopyWithImpl<Species>(this as Species, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Species;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Species&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.commonNameEn, _this.commonNameEn) || other.commonNameEn == _this.commonNameEn)&&(identical(other.commonNameEs, _this.commonNameEs) || other.commonNameEs == _this.commonNameEs)&&(identical(other.scientificName, _this.scientificName) || other.scientificName == _this.scientificName)&&(identical(other.descriptionEn, _this.descriptionEn) || other.descriptionEn == _this.descriptionEn)&&(identical(other.descriptionEs, _this.descriptionEs) || other.descriptionEs == _this.descriptionEs)&&(identical(other.wateringFrequencyDays, _this.wateringFrequencyDays) || other.wateringFrequencyDays == _this.wateringFrequencyDays)&&(identical(other.fertilizingFrequencyDays, _this.fertilizingFrequencyDays) || other.fertilizingFrequencyDays == _this.fertilizingFrequencyDays)&&(identical(other.lightRequirement, _this.lightRequirement) || other.lightRequirement == _this.lightRequirement));
}


@override
int get hashCode {
  final _this = this as Species;
  return Object.hash(runtimeType,_this.id,_this.commonNameEn,_this.commonNameEs,_this.scientificName,_this.descriptionEn,_this.descriptionEs,_this.wateringFrequencyDays,_this.fertilizingFrequencyDays,_this.lightRequirement);
}

@override
String toString() {
  final _this = this as Species;
  return 'Species(id: ${_this.id}, commonNameEn: ${_this.commonNameEn}, commonNameEs: ${_this.commonNameEs}, scientificName: ${_this.scientificName}, descriptionEn: ${_this.descriptionEn}, descriptionEs: ${_this.descriptionEs}, wateringFrequencyDays: ${_this.wateringFrequencyDays}, fertilizingFrequencyDays: ${_this.fertilizingFrequencyDays}, lightRequirement: ${_this.lightRequirement})';
}


}

/// @nodoc
abstract mixin class $SpeciesCopyWith<$Res>  {
  factory $SpeciesCopyWith(Species value, $Res Function(Species) _then) = _$SpeciesCopyWithImpl;
@useResult
$Res call({
 String id, String commonNameEn, String commonNameEs, String scientificName, String descriptionEn, String descriptionEs, int wateringFrequencyDays, int fertilizingFrequencyDays, LightRequirement lightRequirement
});




}
/// @nodoc
class _$SpeciesCopyWithImpl<$Res>
    implements $SpeciesCopyWith<$Res> {
  _$SpeciesCopyWithImpl(this._self, this._then);

  final Species _self;
  final $Res Function(Species) _then;

/// Create a copy of Species
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? commonNameEn = null,Object? commonNameEs = null,Object? scientificName = null,Object? descriptionEn = null,Object? descriptionEs = null,Object? wateringFrequencyDays = null,Object? fertilizingFrequencyDays = null,Object? lightRequirement = null,}) {
  return _then(Species(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,commonNameEn: null == commonNameEn ? _self.commonNameEn : commonNameEn // ignore: cast_nullable_to_non_nullable
as String,commonNameEs: null == commonNameEs ? _self.commonNameEs : commonNameEs // ignore: cast_nullable_to_non_nullable
as String,scientificName: null == scientificName ? _self.scientificName : scientificName // ignore: cast_nullable_to_non_nullable
as String,descriptionEn: null == descriptionEn ? _self.descriptionEn : descriptionEn // ignore: cast_nullable_to_non_nullable
as String,descriptionEs: null == descriptionEs ? _self.descriptionEs : descriptionEs // ignore: cast_nullable_to_non_nullable
as String,wateringFrequencyDays: null == wateringFrequencyDays ? _self.wateringFrequencyDays : wateringFrequencyDays // ignore: cast_nullable_to_non_nullable
as int,fertilizingFrequencyDays: null == fertilizingFrequencyDays ? _self.fertilizingFrequencyDays : fertilizingFrequencyDays // ignore: cast_nullable_to_non_nullable
as int,lightRequirement: null == lightRequirement ? _self.lightRequirement : lightRequirement // ignore: cast_nullable_to_non_nullable
as LightRequirement,
  ));
}

}


/// Adds pattern-matching-related methods to [Species].
extension SpeciesPatterns on Species {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Species value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Species() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Species value)  $default,){
final _that = this;
switch (_that) {
case _Species():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Species value)?  $default,){
final _that = this;
switch (_that) {
case _Species() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String commonNameEn,  String commonNameEs,  String scientificName,  String descriptionEn,  String descriptionEs,  int wateringFrequencyDays,  int fertilizingFrequencyDays,  LightRequirement lightRequirement)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Species() when $default != null:
return $default(_that.id,_that.commonNameEn,_that.commonNameEs,_that.scientificName,_that.descriptionEn,_that.descriptionEs,_that.wateringFrequencyDays,_that.fertilizingFrequencyDays,_that.lightRequirement);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String commonNameEn,  String commonNameEs,  String scientificName,  String descriptionEn,  String descriptionEs,  int wateringFrequencyDays,  int fertilizingFrequencyDays,  LightRequirement lightRequirement)  $default,) {final _that = this;
switch (_that) {
case _Species():
return $default(_that.id,_that.commonNameEn,_that.commonNameEs,_that.scientificName,_that.descriptionEn,_that.descriptionEs,_that.wateringFrequencyDays,_that.fertilizingFrequencyDays,_that.lightRequirement);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String commonNameEn,  String commonNameEs,  String scientificName,  String descriptionEn,  String descriptionEs,  int wateringFrequencyDays,  int fertilizingFrequencyDays,  LightRequirement lightRequirement)?  $default,) {final _that = this;
switch (_that) {
case _Species() when $default != null:
return $default(_that.id,_that.commonNameEn,_that.commonNameEs,_that.scientificName,_that.descriptionEn,_that.descriptionEs,_that.wateringFrequencyDays,_that.fertilizingFrequencyDays,_that.lightRequirement);case _:
  return null;

}
}

}

/// @nodoc


class _Species extends Species {
  const _Species({required this.id, required this.commonNameEn, required this.commonNameEs, required this.scientificName, required this.descriptionEn, required this.descriptionEs, required this.wateringFrequencyDays, required this.fertilizingFrequencyDays, required this.lightRequirement}): super._();
  

@override final  String id;
@override final  String commonNameEn;
@override final  String commonNameEs;
@override final  String scientificName;
@override final  String descriptionEn;
@override final  String descriptionEs;
@override final  int wateringFrequencyDays;
@override final  int fertilizingFrequencyDays;
@override final  LightRequirement lightRequirement;

/// Create a copy of Species
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpeciesCopyWith<_Species> get copyWith => __$SpeciesCopyWithImpl<_Species>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Species&&(identical(other.id, id) || other.id == id)&&(identical(other.commonNameEn, commonNameEn) || other.commonNameEn == commonNameEn)&&(identical(other.commonNameEs, commonNameEs) || other.commonNameEs == commonNameEs)&&(identical(other.scientificName, scientificName) || other.scientificName == scientificName)&&(identical(other.descriptionEn, descriptionEn) || other.descriptionEn == descriptionEn)&&(identical(other.descriptionEs, descriptionEs) || other.descriptionEs == descriptionEs)&&(identical(other.wateringFrequencyDays, wateringFrequencyDays) || other.wateringFrequencyDays == wateringFrequencyDays)&&(identical(other.fertilizingFrequencyDays, fertilizingFrequencyDays) || other.fertilizingFrequencyDays == fertilizingFrequencyDays)&&(identical(other.lightRequirement, lightRequirement) || other.lightRequirement == lightRequirement));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,commonNameEn,commonNameEs,scientificName,descriptionEn,descriptionEs,wateringFrequencyDays,fertilizingFrequencyDays,lightRequirement);
}

@override
String toString() {
    return 'Species(id: $id, commonNameEn: $commonNameEn, commonNameEs: $commonNameEs, scientificName: $scientificName, descriptionEn: $descriptionEn, descriptionEs: $descriptionEs, wateringFrequencyDays: $wateringFrequencyDays, fertilizingFrequencyDays: $fertilizingFrequencyDays, lightRequirement: $lightRequirement)';
}


}

/// @nodoc
abstract mixin class _$SpeciesCopyWith<$Res> implements $SpeciesCopyWith<$Res> {
  factory _$SpeciesCopyWith(_Species value, $Res Function(_Species) _then) = __$SpeciesCopyWithImpl;
@override @useResult
$Res call({
 String id, String commonNameEn, String commonNameEs, String scientificName, String descriptionEn, String descriptionEs, int wateringFrequencyDays, int fertilizingFrequencyDays, LightRequirement lightRequirement
});




}
/// @nodoc
class __$SpeciesCopyWithImpl<$Res>
    implements _$SpeciesCopyWith<$Res> {
  __$SpeciesCopyWithImpl(this._self, this._then);

  final _Species _self;
  final $Res Function(_Species) _then;

/// Create a copy of Species
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? commonNameEn = null,Object? commonNameEs = null,Object? scientificName = null,Object? descriptionEn = null,Object? descriptionEs = null,Object? wateringFrequencyDays = null,Object? fertilizingFrequencyDays = null,Object? lightRequirement = null,}) {
  return _then(_Species(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,commonNameEn: null == commonNameEn ? _self.commonNameEn : commonNameEn // ignore: cast_nullable_to_non_nullable
as String,commonNameEs: null == commonNameEs ? _self.commonNameEs : commonNameEs // ignore: cast_nullable_to_non_nullable
as String,scientificName: null == scientificName ? _self.scientificName : scientificName // ignore: cast_nullable_to_non_nullable
as String,descriptionEn: null == descriptionEn ? _self.descriptionEn : descriptionEn // ignore: cast_nullable_to_non_nullable
as String,descriptionEs: null == descriptionEs ? _self.descriptionEs : descriptionEs // ignore: cast_nullable_to_non_nullable
as String,wateringFrequencyDays: null == wateringFrequencyDays ? _self.wateringFrequencyDays : wateringFrequencyDays // ignore: cast_nullable_to_non_nullable
as int,fertilizingFrequencyDays: null == fertilizingFrequencyDays ? _self.fertilizingFrequencyDays : fertilizingFrequencyDays // ignore: cast_nullable_to_non_nullable
as int,lightRequirement: null == lightRequirement ? _self.lightRequirement : lightRequirement // ignore: cast_nullable_to_non_nullable
as LightRequirement,
  ));
}


}

// dart format on
