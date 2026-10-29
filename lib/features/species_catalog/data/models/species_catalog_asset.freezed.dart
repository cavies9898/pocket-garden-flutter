// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'species_catalog_asset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SpeciesCatalogAsset {

 int get version; List<SpeciesSeedEntry> get species;
/// Create a copy of SpeciesCatalogAsset
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpeciesCatalogAssetCopyWith<SpeciesCatalogAsset> get copyWith => _$SpeciesCatalogAssetCopyWithImpl<SpeciesCatalogAsset>(this as SpeciesCatalogAsset, _$identity);

  /// Serializes this SpeciesCatalogAsset to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SpeciesCatalogAsset;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpeciesCatalogAsset&&(identical(other.version, _this.version) || other.version == _this.version)&&const DeepCollectionEquality().equals(other.species, _this.species));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SpeciesCatalogAsset;
  return Object.hash(runtimeType,_this.version,const DeepCollectionEquality().hash(_this.species));
}

@override
String toString() {
  final _this = this as SpeciesCatalogAsset;
  return 'SpeciesCatalogAsset(version: ${_this.version}, species: ${_this.species})';
}


}

/// @nodoc
abstract mixin class $SpeciesCatalogAssetCopyWith<$Res>  {
  factory $SpeciesCatalogAssetCopyWith(SpeciesCatalogAsset value, $Res Function(SpeciesCatalogAsset) _then) = _$SpeciesCatalogAssetCopyWithImpl;
@useResult
$Res call({
 int version, List<SpeciesSeedEntry> species
});




}
/// @nodoc
class _$SpeciesCatalogAssetCopyWithImpl<$Res>
    implements $SpeciesCatalogAssetCopyWith<$Res> {
  _$SpeciesCatalogAssetCopyWithImpl(this._self, this._then);

  final SpeciesCatalogAsset _self;
  final $Res Function(SpeciesCatalogAsset) _then;

/// Create a copy of SpeciesCatalogAsset
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? version = null,Object? species = null,}) {
  return _then(SpeciesCatalogAsset(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,species: null == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as List<SpeciesSeedEntry>,
  ));
}

}


/// Adds pattern-matching-related methods to [SpeciesCatalogAsset].
extension SpeciesCatalogAssetPatterns on SpeciesCatalogAsset {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpeciesCatalogAsset value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpeciesCatalogAsset() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpeciesCatalogAsset value)  $default,){
final _that = this;
switch (_that) {
case _SpeciesCatalogAsset():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpeciesCatalogAsset value)?  $default,){
final _that = this;
switch (_that) {
case _SpeciesCatalogAsset() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int version,  List<SpeciesSeedEntry> species)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpeciesCatalogAsset() when $default != null:
return $default(_that.version,_that.species);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int version,  List<SpeciesSeedEntry> species)  $default,) {final _that = this;
switch (_that) {
case _SpeciesCatalogAsset():
return $default(_that.version,_that.species);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int version,  List<SpeciesSeedEntry> species)?  $default,) {final _that = this;
switch (_that) {
case _SpeciesCatalogAsset() when $default != null:
return $default(_that.version,_that.species);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpeciesCatalogAsset implements SpeciesCatalogAsset {
  const _SpeciesCatalogAsset({required this.version, required  List<SpeciesSeedEntry> species}): _species = species;
  factory _SpeciesCatalogAsset.fromJson(Map<String, dynamic> json) => _$SpeciesCatalogAssetFromJson(json);

@override final  int version;
 final  List<SpeciesSeedEntry> _species;
@override List<SpeciesSeedEntry> get species {
  if (_species is EqualUnmodifiableListView) return _species;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_species);
}


/// Create a copy of SpeciesCatalogAsset
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpeciesCatalogAssetCopyWith<_SpeciesCatalogAsset> get copyWith => __$SpeciesCatalogAssetCopyWithImpl<_SpeciesCatalogAsset>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpeciesCatalogAssetToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpeciesCatalogAsset&&(identical(other.version, version) || other.version == version)&&const DeepCollectionEquality().equals(other.species, _species));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,version,const DeepCollectionEquality().hash(_species));
}

@override
String toString() {
    return 'SpeciesCatalogAsset(version: $version, species: $species)';
}


}

/// @nodoc
abstract mixin class _$SpeciesCatalogAssetCopyWith<$Res> implements $SpeciesCatalogAssetCopyWith<$Res> {
  factory _$SpeciesCatalogAssetCopyWith(_SpeciesCatalogAsset value, $Res Function(_SpeciesCatalogAsset) _then) = __$SpeciesCatalogAssetCopyWithImpl;
@override @useResult
$Res call({
 int version, List<SpeciesSeedEntry> species
});




}
/// @nodoc
class __$SpeciesCatalogAssetCopyWithImpl<$Res>
    implements _$SpeciesCatalogAssetCopyWith<$Res> {
  __$SpeciesCatalogAssetCopyWithImpl(this._self, this._then);

  final _SpeciesCatalogAsset _self;
  final $Res Function(_SpeciesCatalogAsset) _then;

/// Create a copy of SpeciesCatalogAsset
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? version = null,Object? species = null,}) {
  return _then(_SpeciesCatalogAsset(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,species: null == species ? _self._species : species // ignore: cast_nullable_to_non_nullable
as List<SpeciesSeedEntry>,
  ));
}


}


/// @nodoc
mixin _$SpeciesSeedEntry {

 String get id;@JsonKey(name: 'common_name_en') String get commonNameEn;@JsonKey(name: 'common_name_es') String get commonNameEs;@JsonKey(name: 'scientific_name') String get scientificName;@JsonKey(name: 'description_en') String get descriptionEn;@JsonKey(name: 'description_es') String get descriptionEs;@JsonKey(name: 'watering_frequency_days') int get wateringFrequencyDays;@JsonKey(name: 'fertilizing_frequency_days') int get fertilizingFrequencyDays;@JsonKey(name: 'light_requirement') String get lightRequirement;
/// Create a copy of SpeciesSeedEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpeciesSeedEntryCopyWith<SpeciesSeedEntry> get copyWith => _$SpeciesSeedEntryCopyWithImpl<SpeciesSeedEntry>(this as SpeciesSeedEntry, _$identity);

  /// Serializes this SpeciesSeedEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SpeciesSeedEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpeciesSeedEntry&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.commonNameEn, _this.commonNameEn) || other.commonNameEn == _this.commonNameEn)&&(identical(other.commonNameEs, _this.commonNameEs) || other.commonNameEs == _this.commonNameEs)&&(identical(other.scientificName, _this.scientificName) || other.scientificName == _this.scientificName)&&(identical(other.descriptionEn, _this.descriptionEn) || other.descriptionEn == _this.descriptionEn)&&(identical(other.descriptionEs, _this.descriptionEs) || other.descriptionEs == _this.descriptionEs)&&(identical(other.wateringFrequencyDays, _this.wateringFrequencyDays) || other.wateringFrequencyDays == _this.wateringFrequencyDays)&&(identical(other.fertilizingFrequencyDays, _this.fertilizingFrequencyDays) || other.fertilizingFrequencyDays == _this.fertilizingFrequencyDays)&&(identical(other.lightRequirement, _this.lightRequirement) || other.lightRequirement == _this.lightRequirement));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SpeciesSeedEntry;
  return Object.hash(runtimeType,_this.id,_this.commonNameEn,_this.commonNameEs,_this.scientificName,_this.descriptionEn,_this.descriptionEs,_this.wateringFrequencyDays,_this.fertilizingFrequencyDays,_this.lightRequirement);
}

@override
String toString() {
  final _this = this as SpeciesSeedEntry;
  return 'SpeciesSeedEntry(id: ${_this.id}, commonNameEn: ${_this.commonNameEn}, commonNameEs: ${_this.commonNameEs}, scientificName: ${_this.scientificName}, descriptionEn: ${_this.descriptionEn}, descriptionEs: ${_this.descriptionEs}, wateringFrequencyDays: ${_this.wateringFrequencyDays}, fertilizingFrequencyDays: ${_this.fertilizingFrequencyDays}, lightRequirement: ${_this.lightRequirement})';
}


}

/// @nodoc
abstract mixin class $SpeciesSeedEntryCopyWith<$Res>  {
  factory $SpeciesSeedEntryCopyWith(SpeciesSeedEntry value, $Res Function(SpeciesSeedEntry) _then) = _$SpeciesSeedEntryCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'common_name_en') String commonNameEn,@JsonKey(name: 'common_name_es') String commonNameEs,@JsonKey(name: 'scientific_name') String scientificName,@JsonKey(name: 'description_en') String descriptionEn,@JsonKey(name: 'description_es') String descriptionEs,@JsonKey(name: 'watering_frequency_days') int wateringFrequencyDays,@JsonKey(name: 'fertilizing_frequency_days') int fertilizingFrequencyDays,@JsonKey(name: 'light_requirement') String lightRequirement
});




}
/// @nodoc
class _$SpeciesSeedEntryCopyWithImpl<$Res>
    implements $SpeciesSeedEntryCopyWith<$Res> {
  _$SpeciesSeedEntryCopyWithImpl(this._self, this._then);

  final SpeciesSeedEntry _self;
  final $Res Function(SpeciesSeedEntry) _then;

/// Create a copy of SpeciesSeedEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? commonNameEn = null,Object? commonNameEs = null,Object? scientificName = null,Object? descriptionEn = null,Object? descriptionEs = null,Object? wateringFrequencyDays = null,Object? fertilizingFrequencyDays = null,Object? lightRequirement = null,}) {
  return _then(SpeciesSeedEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,commonNameEn: null == commonNameEn ? _self.commonNameEn : commonNameEn // ignore: cast_nullable_to_non_nullable
as String,commonNameEs: null == commonNameEs ? _self.commonNameEs : commonNameEs // ignore: cast_nullable_to_non_nullable
as String,scientificName: null == scientificName ? _self.scientificName : scientificName // ignore: cast_nullable_to_non_nullable
as String,descriptionEn: null == descriptionEn ? _self.descriptionEn : descriptionEn // ignore: cast_nullable_to_non_nullable
as String,descriptionEs: null == descriptionEs ? _self.descriptionEs : descriptionEs // ignore: cast_nullable_to_non_nullable
as String,wateringFrequencyDays: null == wateringFrequencyDays ? _self.wateringFrequencyDays : wateringFrequencyDays // ignore: cast_nullable_to_non_nullable
as int,fertilizingFrequencyDays: null == fertilizingFrequencyDays ? _self.fertilizingFrequencyDays : fertilizingFrequencyDays // ignore: cast_nullable_to_non_nullable
as int,lightRequirement: null == lightRequirement ? _self.lightRequirement : lightRequirement // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SpeciesSeedEntry].
extension SpeciesSeedEntryPatterns on SpeciesSeedEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpeciesSeedEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpeciesSeedEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpeciesSeedEntry value)  $default,){
final _that = this;
switch (_that) {
case _SpeciesSeedEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpeciesSeedEntry value)?  $default,){
final _that = this;
switch (_that) {
case _SpeciesSeedEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'common_name_en')  String commonNameEn, @JsonKey(name: 'common_name_es')  String commonNameEs, @JsonKey(name: 'scientific_name')  String scientificName, @JsonKey(name: 'description_en')  String descriptionEn, @JsonKey(name: 'description_es')  String descriptionEs, @JsonKey(name: 'watering_frequency_days')  int wateringFrequencyDays, @JsonKey(name: 'fertilizing_frequency_days')  int fertilizingFrequencyDays, @JsonKey(name: 'light_requirement')  String lightRequirement)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpeciesSeedEntry() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'common_name_en')  String commonNameEn, @JsonKey(name: 'common_name_es')  String commonNameEs, @JsonKey(name: 'scientific_name')  String scientificName, @JsonKey(name: 'description_en')  String descriptionEn, @JsonKey(name: 'description_es')  String descriptionEs, @JsonKey(name: 'watering_frequency_days')  int wateringFrequencyDays, @JsonKey(name: 'fertilizing_frequency_days')  int fertilizingFrequencyDays, @JsonKey(name: 'light_requirement')  String lightRequirement)  $default,) {final _that = this;
switch (_that) {
case _SpeciesSeedEntry():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'common_name_en')  String commonNameEn, @JsonKey(name: 'common_name_es')  String commonNameEs, @JsonKey(name: 'scientific_name')  String scientificName, @JsonKey(name: 'description_en')  String descriptionEn, @JsonKey(name: 'description_es')  String descriptionEs, @JsonKey(name: 'watering_frequency_days')  int wateringFrequencyDays, @JsonKey(name: 'fertilizing_frequency_days')  int fertilizingFrequencyDays, @JsonKey(name: 'light_requirement')  String lightRequirement)?  $default,) {final _that = this;
switch (_that) {
case _SpeciesSeedEntry() when $default != null:
return $default(_that.id,_that.commonNameEn,_that.commonNameEs,_that.scientificName,_that.descriptionEn,_that.descriptionEs,_that.wateringFrequencyDays,_that.fertilizingFrequencyDays,_that.lightRequirement);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpeciesSeedEntry implements SpeciesSeedEntry {
  const _SpeciesSeedEntry({required this.id, @JsonKey(name: 'common_name_en') required this.commonNameEn, @JsonKey(name: 'common_name_es') required this.commonNameEs, @JsonKey(name: 'scientific_name') required this.scientificName, @JsonKey(name: 'description_en') required this.descriptionEn, @JsonKey(name: 'description_es') required this.descriptionEs, @JsonKey(name: 'watering_frequency_days') required this.wateringFrequencyDays, @JsonKey(name: 'fertilizing_frequency_days') required this.fertilizingFrequencyDays, @JsonKey(name: 'light_requirement') required this.lightRequirement});
  factory _SpeciesSeedEntry.fromJson(Map<String, dynamic> json) => _$SpeciesSeedEntryFromJson(json);

@override final  String id;
@override@JsonKey(name: 'common_name_en') final  String commonNameEn;
@override@JsonKey(name: 'common_name_es') final  String commonNameEs;
@override@JsonKey(name: 'scientific_name') final  String scientificName;
@override@JsonKey(name: 'description_en') final  String descriptionEn;
@override@JsonKey(name: 'description_es') final  String descriptionEs;
@override@JsonKey(name: 'watering_frequency_days') final  int wateringFrequencyDays;
@override@JsonKey(name: 'fertilizing_frequency_days') final  int fertilizingFrequencyDays;
@override@JsonKey(name: 'light_requirement') final  String lightRequirement;

/// Create a copy of SpeciesSeedEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpeciesSeedEntryCopyWith<_SpeciesSeedEntry> get copyWith => __$SpeciesSeedEntryCopyWithImpl<_SpeciesSeedEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpeciesSeedEntryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpeciesSeedEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.commonNameEn, commonNameEn) || other.commonNameEn == commonNameEn)&&(identical(other.commonNameEs, commonNameEs) || other.commonNameEs == commonNameEs)&&(identical(other.scientificName, scientificName) || other.scientificName == scientificName)&&(identical(other.descriptionEn, descriptionEn) || other.descriptionEn == descriptionEn)&&(identical(other.descriptionEs, descriptionEs) || other.descriptionEs == descriptionEs)&&(identical(other.wateringFrequencyDays, wateringFrequencyDays) || other.wateringFrequencyDays == wateringFrequencyDays)&&(identical(other.fertilizingFrequencyDays, fertilizingFrequencyDays) || other.fertilizingFrequencyDays == fertilizingFrequencyDays)&&(identical(other.lightRequirement, lightRequirement) || other.lightRequirement == lightRequirement));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,commonNameEn,commonNameEs,scientificName,descriptionEn,descriptionEs,wateringFrequencyDays,fertilizingFrequencyDays,lightRequirement);
}

@override
String toString() {
    return 'SpeciesSeedEntry(id: $id, commonNameEn: $commonNameEn, commonNameEs: $commonNameEs, scientificName: $scientificName, descriptionEn: $descriptionEn, descriptionEs: $descriptionEs, wateringFrequencyDays: $wateringFrequencyDays, fertilizingFrequencyDays: $fertilizingFrequencyDays, lightRequirement: $lightRequirement)';
}


}

/// @nodoc
abstract mixin class _$SpeciesSeedEntryCopyWith<$Res> implements $SpeciesSeedEntryCopyWith<$Res> {
  factory _$SpeciesSeedEntryCopyWith(_SpeciesSeedEntry value, $Res Function(_SpeciesSeedEntry) _then) = __$SpeciesSeedEntryCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'common_name_en') String commonNameEn,@JsonKey(name: 'common_name_es') String commonNameEs,@JsonKey(name: 'scientific_name') String scientificName,@JsonKey(name: 'description_en') String descriptionEn,@JsonKey(name: 'description_es') String descriptionEs,@JsonKey(name: 'watering_frequency_days') int wateringFrequencyDays,@JsonKey(name: 'fertilizing_frequency_days') int fertilizingFrequencyDays,@JsonKey(name: 'light_requirement') String lightRequirement
});




}
/// @nodoc
class __$SpeciesSeedEntryCopyWithImpl<$Res>
    implements _$SpeciesSeedEntryCopyWith<$Res> {
  __$SpeciesSeedEntryCopyWithImpl(this._self, this._then);

  final _SpeciesSeedEntry _self;
  final $Res Function(_SpeciesSeedEntry) _then;

/// Create a copy of SpeciesSeedEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? commonNameEn = null,Object? commonNameEs = null,Object? scientificName = null,Object? descriptionEn = null,Object? descriptionEs = null,Object? wateringFrequencyDays = null,Object? fertilizingFrequencyDays = null,Object? lightRequirement = null,}) {
  return _then(_SpeciesSeedEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,commonNameEn: null == commonNameEn ? _self.commonNameEn : commonNameEn // ignore: cast_nullable_to_non_nullable
as String,commonNameEs: null == commonNameEs ? _self.commonNameEs : commonNameEs // ignore: cast_nullable_to_non_nullable
as String,scientificName: null == scientificName ? _self.scientificName : scientificName // ignore: cast_nullable_to_non_nullable
as String,descriptionEn: null == descriptionEn ? _self.descriptionEn : descriptionEn // ignore: cast_nullable_to_non_nullable
as String,descriptionEs: null == descriptionEs ? _self.descriptionEs : descriptionEs // ignore: cast_nullable_to_non_nullable
as String,wateringFrequencyDays: null == wateringFrequencyDays ? _self.wateringFrequencyDays : wateringFrequencyDays // ignore: cast_nullable_to_non_nullable
as int,fertilizingFrequencyDays: null == fertilizingFrequencyDays ? _self.fertilizingFrequencyDays : fertilizingFrequencyDays // ignore: cast_nullable_to_non_nullable
as int,lightRequirement: null == lightRequirement ? _self.lightRequirement : lightRequirement // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
