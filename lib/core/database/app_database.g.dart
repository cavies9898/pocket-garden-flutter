// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $SpeciesTableTable extends SpeciesTable
    with TableInfo<$SpeciesTableTable, SpeciesRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SpeciesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _commonNameEnMeta = const VerificationMeta(
    'commonNameEn',
  );
  @override
  late final GeneratedColumn<String> commonNameEn = GeneratedColumn<String>(
    'common_name_en',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _commonNameEsMeta = const VerificationMeta(
    'commonNameEs',
  );
  @override
  late final GeneratedColumn<String> commonNameEs = GeneratedColumn<String>(
    'common_name_es',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scientificNameMeta = const VerificationMeta(
    'scientificName',
  );
  @override
  late final GeneratedColumn<String> scientificName = GeneratedColumn<String>(
    'scientific_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionEnMeta = const VerificationMeta(
    'descriptionEn',
  );
  @override
  late final GeneratedColumn<String> descriptionEn = GeneratedColumn<String>(
    'description_en',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionEsMeta = const VerificationMeta(
    'descriptionEs',
  );
  @override
  late final GeneratedColumn<String> descriptionEs = GeneratedColumn<String>(
    'description_es',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _wateringFrequencyDaysMeta =
      const VerificationMeta('wateringFrequencyDays');
  @override
  late final GeneratedColumn<int> wateringFrequencyDays = GeneratedColumn<int>(
    'watering_frequency_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fertilizingFrequencyDaysMeta =
      const VerificationMeta('fertilizingFrequencyDays');
  @override
  late final GeneratedColumn<int> fertilizingFrequencyDays =
      GeneratedColumn<int>(
        'fertilizing_frequency_days',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      );
  @override
  late final GeneratedColumnWithTypeConverter<LightRequirement, String>
  lightRequirement =
      GeneratedColumn<String>(
        'light_requirement',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<LightRequirement>(
        $SpeciesTableTable.$converterlightRequirement,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    commonNameEn,
    commonNameEs,
    scientificName,
    descriptionEn,
    descriptionEs,
    wateringFrequencyDays,
    fertilizingFrequencyDays,
    lightRequirement,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'species';
  @override
  VerificationContext validateIntegrity(
    Insertable<SpeciesRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('common_name_en')) {
      context.handle(
        _commonNameEnMeta,
        commonNameEn.isAcceptableOrUnknown(
          data['common_name_en']!,
          _commonNameEnMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_commonNameEnMeta);
    }
    if (data.containsKey('common_name_es')) {
      context.handle(
        _commonNameEsMeta,
        commonNameEs.isAcceptableOrUnknown(
          data['common_name_es']!,
          _commonNameEsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_commonNameEsMeta);
    }
    if (data.containsKey('scientific_name')) {
      context.handle(
        _scientificNameMeta,
        scientificName.isAcceptableOrUnknown(
          data['scientific_name']!,
          _scientificNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scientificNameMeta);
    }
    if (data.containsKey('description_en')) {
      context.handle(
        _descriptionEnMeta,
        descriptionEn.isAcceptableOrUnknown(
          data['description_en']!,
          _descriptionEnMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionEnMeta);
    }
    if (data.containsKey('description_es')) {
      context.handle(
        _descriptionEsMeta,
        descriptionEs.isAcceptableOrUnknown(
          data['description_es']!,
          _descriptionEsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionEsMeta);
    }
    if (data.containsKey('watering_frequency_days')) {
      context.handle(
        _wateringFrequencyDaysMeta,
        wateringFrequencyDays.isAcceptableOrUnknown(
          data['watering_frequency_days']!,
          _wateringFrequencyDaysMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_wateringFrequencyDaysMeta);
    }
    if (data.containsKey('fertilizing_frequency_days')) {
      context.handle(
        _fertilizingFrequencyDaysMeta,
        fertilizingFrequencyDays.isAcceptableOrUnknown(
          data['fertilizing_frequency_days']!,
          _fertilizingFrequencyDaysMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fertilizingFrequencyDaysMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SpeciesRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SpeciesRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      commonNameEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}common_name_en'],
      )!,
      commonNameEs: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}common_name_es'],
      )!,
      scientificName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}scientific_name'],
      )!,
      descriptionEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description_en'],
      )!,
      descriptionEs: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description_es'],
      )!,
      wateringFrequencyDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}watering_frequency_days'],
      )!,
      fertilizingFrequencyDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}fertilizing_frequency_days'],
      )!,
      lightRequirement: $SpeciesTableTable.$converterlightRequirement.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}light_requirement'],
        )!,
      ),
    );
  }

  @override
  $SpeciesTableTable createAlias(String alias) {
    return $SpeciesTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<LightRequirement, String, String>
  $converterlightRequirement = const EnumNameConverter<LightRequirement>(
    LightRequirement.values,
  );
}

class SpeciesRow extends DataClass implements Insertable<SpeciesRow> {
  final String id;
  final String commonNameEn;
  final String commonNameEs;
  final String scientificName;
  final String descriptionEn;
  final String descriptionEs;
  final int wateringFrequencyDays;
  final int fertilizingFrequencyDays;
  final LightRequirement lightRequirement;
  const SpeciesRow({
    required this.id,
    required this.commonNameEn,
    required this.commonNameEs,
    required this.scientificName,
    required this.descriptionEn,
    required this.descriptionEs,
    required this.wateringFrequencyDays,
    required this.fertilizingFrequencyDays,
    required this.lightRequirement,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['common_name_en'] = Variable<String>(commonNameEn);
    map['common_name_es'] = Variable<String>(commonNameEs);
    map['scientific_name'] = Variable<String>(scientificName);
    map['description_en'] = Variable<String>(descriptionEn);
    map['description_es'] = Variable<String>(descriptionEs);
    map['watering_frequency_days'] = Variable<int>(wateringFrequencyDays);
    map['fertilizing_frequency_days'] = Variable<int>(fertilizingFrequencyDays);
    {
      map['light_requirement'] = Variable<String>(
        $SpeciesTableTable.$converterlightRequirement.toSql(lightRequirement),
      );
    }
    return map;
  }

  SpeciesTableCompanion toCompanion(bool nullToAbsent) {
    return SpeciesTableCompanion(
      id: Value(id),
      commonNameEn: Value(commonNameEn),
      commonNameEs: Value(commonNameEs),
      scientificName: Value(scientificName),
      descriptionEn: Value(descriptionEn),
      descriptionEs: Value(descriptionEs),
      wateringFrequencyDays: Value(wateringFrequencyDays),
      fertilizingFrequencyDays: Value(fertilizingFrequencyDays),
      lightRequirement: Value(lightRequirement),
    );
  }

  factory SpeciesRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SpeciesRow(
      id: serializer.fromJson<String>(json['id']),
      commonNameEn: serializer.fromJson<String>(json['commonNameEn']),
      commonNameEs: serializer.fromJson<String>(json['commonNameEs']),
      scientificName: serializer.fromJson<String>(json['scientificName']),
      descriptionEn: serializer.fromJson<String>(json['descriptionEn']),
      descriptionEs: serializer.fromJson<String>(json['descriptionEs']),
      wateringFrequencyDays: serializer.fromJson<int>(
        json['wateringFrequencyDays'],
      ),
      fertilizingFrequencyDays: serializer.fromJson<int>(
        json['fertilizingFrequencyDays'],
      ),
      lightRequirement: $SpeciesTableTable.$converterlightRequirement.fromJson(
        serializer.fromJson<String>(json['lightRequirement']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'commonNameEn': serializer.toJson<String>(commonNameEn),
      'commonNameEs': serializer.toJson<String>(commonNameEs),
      'scientificName': serializer.toJson<String>(scientificName),
      'descriptionEn': serializer.toJson<String>(descriptionEn),
      'descriptionEs': serializer.toJson<String>(descriptionEs),
      'wateringFrequencyDays': serializer.toJson<int>(wateringFrequencyDays),
      'fertilizingFrequencyDays': serializer.toJson<int>(
        fertilizingFrequencyDays,
      ),
      'lightRequirement': serializer.toJson<String>(
        $SpeciesTableTable.$converterlightRequirement.toJson(lightRequirement),
      ),
    };
  }

  SpeciesRow copyWith({
    String? id,
    String? commonNameEn,
    String? commonNameEs,
    String? scientificName,
    String? descriptionEn,
    String? descriptionEs,
    int? wateringFrequencyDays,
    int? fertilizingFrequencyDays,
    LightRequirement? lightRequirement,
  }) => SpeciesRow(
    id: id ?? this.id,
    commonNameEn: commonNameEn ?? this.commonNameEn,
    commonNameEs: commonNameEs ?? this.commonNameEs,
    scientificName: scientificName ?? this.scientificName,
    descriptionEn: descriptionEn ?? this.descriptionEn,
    descriptionEs: descriptionEs ?? this.descriptionEs,
    wateringFrequencyDays: wateringFrequencyDays ?? this.wateringFrequencyDays,
    fertilizingFrequencyDays:
        fertilizingFrequencyDays ?? this.fertilizingFrequencyDays,
    lightRequirement: lightRequirement ?? this.lightRequirement,
  );
  SpeciesRow copyWithCompanion(SpeciesTableCompanion data) {
    return SpeciesRow(
      id: data.id.present ? data.id.value : this.id,
      commonNameEn: data.commonNameEn.present
          ? data.commonNameEn.value
          : this.commonNameEn,
      commonNameEs: data.commonNameEs.present
          ? data.commonNameEs.value
          : this.commonNameEs,
      scientificName: data.scientificName.present
          ? data.scientificName.value
          : this.scientificName,
      descriptionEn: data.descriptionEn.present
          ? data.descriptionEn.value
          : this.descriptionEn,
      descriptionEs: data.descriptionEs.present
          ? data.descriptionEs.value
          : this.descriptionEs,
      wateringFrequencyDays: data.wateringFrequencyDays.present
          ? data.wateringFrequencyDays.value
          : this.wateringFrequencyDays,
      fertilizingFrequencyDays: data.fertilizingFrequencyDays.present
          ? data.fertilizingFrequencyDays.value
          : this.fertilizingFrequencyDays,
      lightRequirement: data.lightRequirement.present
          ? data.lightRequirement.value
          : this.lightRequirement,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SpeciesRow(')
          ..write('id: $id, ')
          ..write('commonNameEn: $commonNameEn, ')
          ..write('commonNameEs: $commonNameEs, ')
          ..write('scientificName: $scientificName, ')
          ..write('descriptionEn: $descriptionEn, ')
          ..write('descriptionEs: $descriptionEs, ')
          ..write('wateringFrequencyDays: $wateringFrequencyDays, ')
          ..write('fertilizingFrequencyDays: $fertilizingFrequencyDays, ')
          ..write('lightRequirement: $lightRequirement')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    commonNameEn,
    commonNameEs,
    scientificName,
    descriptionEn,
    descriptionEs,
    wateringFrequencyDays,
    fertilizingFrequencyDays,
    lightRequirement,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SpeciesRow &&
          other.id == this.id &&
          other.commonNameEn == this.commonNameEn &&
          other.commonNameEs == this.commonNameEs &&
          other.scientificName == this.scientificName &&
          other.descriptionEn == this.descriptionEn &&
          other.descriptionEs == this.descriptionEs &&
          other.wateringFrequencyDays == this.wateringFrequencyDays &&
          other.fertilizingFrequencyDays == this.fertilizingFrequencyDays &&
          other.lightRequirement == this.lightRequirement);
}

class SpeciesTableCompanion extends UpdateCompanion<SpeciesRow> {
  final Value<String> id;
  final Value<String> commonNameEn;
  final Value<String> commonNameEs;
  final Value<String> scientificName;
  final Value<String> descriptionEn;
  final Value<String> descriptionEs;
  final Value<int> wateringFrequencyDays;
  final Value<int> fertilizingFrequencyDays;
  final Value<LightRequirement> lightRequirement;
  final Value<int> rowid;
  const SpeciesTableCompanion({
    this.id = const Value.absent(),
    this.commonNameEn = const Value.absent(),
    this.commonNameEs = const Value.absent(),
    this.scientificName = const Value.absent(),
    this.descriptionEn = const Value.absent(),
    this.descriptionEs = const Value.absent(),
    this.wateringFrequencyDays = const Value.absent(),
    this.fertilizingFrequencyDays = const Value.absent(),
    this.lightRequirement = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SpeciesTableCompanion.insert({
    required String id,
    required String commonNameEn,
    required String commonNameEs,
    required String scientificName,
    required String descriptionEn,
    required String descriptionEs,
    required int wateringFrequencyDays,
    required int fertilizingFrequencyDays,
    required LightRequirement lightRequirement,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       commonNameEn = Value(commonNameEn),
       commonNameEs = Value(commonNameEs),
       scientificName = Value(scientificName),
       descriptionEn = Value(descriptionEn),
       descriptionEs = Value(descriptionEs),
       wateringFrequencyDays = Value(wateringFrequencyDays),
       fertilizingFrequencyDays = Value(fertilizingFrequencyDays),
       lightRequirement = Value(lightRequirement);
  static Insertable<SpeciesRow> custom({
    Expression<String>? id,
    Expression<String>? commonNameEn,
    Expression<String>? commonNameEs,
    Expression<String>? scientificName,
    Expression<String>? descriptionEn,
    Expression<String>? descriptionEs,
    Expression<int>? wateringFrequencyDays,
    Expression<int>? fertilizingFrequencyDays,
    Expression<String>? lightRequirement,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (commonNameEn != null) 'common_name_en': commonNameEn,
      if (commonNameEs != null) 'common_name_es': commonNameEs,
      if (scientificName != null) 'scientific_name': scientificName,
      if (descriptionEn != null) 'description_en': descriptionEn,
      if (descriptionEs != null) 'description_es': descriptionEs,
      if (wateringFrequencyDays != null)
        'watering_frequency_days': wateringFrequencyDays,
      if (fertilizingFrequencyDays != null)
        'fertilizing_frequency_days': fertilizingFrequencyDays,
      if (lightRequirement != null) 'light_requirement': lightRequirement,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SpeciesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? commonNameEn,
    Value<String>? commonNameEs,
    Value<String>? scientificName,
    Value<String>? descriptionEn,
    Value<String>? descriptionEs,
    Value<int>? wateringFrequencyDays,
    Value<int>? fertilizingFrequencyDays,
    Value<LightRequirement>? lightRequirement,
    Value<int>? rowid,
  }) {
    return SpeciesTableCompanion(
      id: id ?? this.id,
      commonNameEn: commonNameEn ?? this.commonNameEn,
      commonNameEs: commonNameEs ?? this.commonNameEs,
      scientificName: scientificName ?? this.scientificName,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      descriptionEs: descriptionEs ?? this.descriptionEs,
      wateringFrequencyDays:
          wateringFrequencyDays ?? this.wateringFrequencyDays,
      fertilizingFrequencyDays:
          fertilizingFrequencyDays ?? this.fertilizingFrequencyDays,
      lightRequirement: lightRequirement ?? this.lightRequirement,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (commonNameEn.present) {
      map['common_name_en'] = Variable<String>(commonNameEn.value);
    }
    if (commonNameEs.present) {
      map['common_name_es'] = Variable<String>(commonNameEs.value);
    }
    if (scientificName.present) {
      map['scientific_name'] = Variable<String>(scientificName.value);
    }
    if (descriptionEn.present) {
      map['description_en'] = Variable<String>(descriptionEn.value);
    }
    if (descriptionEs.present) {
      map['description_es'] = Variable<String>(descriptionEs.value);
    }
    if (wateringFrequencyDays.present) {
      map['watering_frequency_days'] = Variable<int>(
        wateringFrequencyDays.value,
      );
    }
    if (fertilizingFrequencyDays.present) {
      map['fertilizing_frequency_days'] = Variable<int>(
        fertilizingFrequencyDays.value,
      );
    }
    if (lightRequirement.present) {
      map['light_requirement'] = Variable<String>(
        $SpeciesTableTable.$converterlightRequirement.toSql(
          lightRequirement.value,
        ),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SpeciesTableCompanion(')
          ..write('id: $id, ')
          ..write('commonNameEn: $commonNameEn, ')
          ..write('commonNameEs: $commonNameEs, ')
          ..write('scientificName: $scientificName, ')
          ..write('descriptionEn: $descriptionEn, ')
          ..write('descriptionEs: $descriptionEs, ')
          ..write('wateringFrequencyDays: $wateringFrequencyDays, ')
          ..write('fertilizingFrequencyDays: $fertilizingFrequencyDays, ')
          ..write('lightRequirement: $lightRequirement, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PlantsTableTable extends PlantsTable
    with TableInfo<$PlantsTableTable, PlantRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlantsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nicknameMeta = const VerificationMeta(
    'nickname',
  );
  @override
  late final GeneratedColumn<String> nickname = GeneratedColumn<String>(
    'nickname',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(minTextLength: 1),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _speciesIdMeta = const VerificationMeta(
    'speciesId',
  );
  @override
  late final GeneratedColumn<String> speciesId = GeneratedColumn<String>(
    'species_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES species (id)',
    ),
  );
  static const VerificationMeta _photoPathMeta = const VerificationMeta(
    'photoPath',
  );
  @override
  late final GeneratedColumn<String> photoPath = GeneratedColumn<String>(
    'photo_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<PlantLocation, String> location =
      GeneratedColumn<String>(
        'location',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<PlantLocation>($PlantsTableTable.$converterlocation);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    nickname,
    speciesId,
    photoPath,
    location,
    notes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'plants';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlantRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('nickname')) {
      context.handle(
        _nicknameMeta,
        nickname.isAcceptableOrUnknown(data['nickname']!, _nicknameMeta),
      );
    } else if (isInserting) {
      context.missing(_nicknameMeta);
    }
    if (data.containsKey('species_id')) {
      context.handle(
        _speciesIdMeta,
        speciesId.isAcceptableOrUnknown(data['species_id']!, _speciesIdMeta),
      );
    } else if (isInserting) {
      context.missing(_speciesIdMeta);
    }
    if (data.containsKey('photo_path')) {
      context.handle(
        _photoPathMeta,
        photoPath.isAcceptableOrUnknown(data['photo_path']!, _photoPathMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlantRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlantRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      nickname: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nickname'],
      )!,
      speciesId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}species_id'],
      )!,
      photoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_path'],
      ),
      location: $PlantsTableTable.$converterlocation.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}location'],
        )!,
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $PlantsTableTable createAlias(String alias) {
    return $PlantsTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<PlantLocation, String, String> $converterlocation =
      const EnumNameConverter<PlantLocation>(PlantLocation.values);
}

class PlantRow extends DataClass implements Insertable<PlantRow> {
  final String id;
  final String nickname;
  final String speciesId;
  final String? photoPath;
  final PlantLocation location;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const PlantRow({
    required this.id,
    required this.nickname,
    required this.speciesId,
    this.photoPath,
    required this.location,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['nickname'] = Variable<String>(nickname);
    map['species_id'] = Variable<String>(speciesId);
    if (!nullToAbsent || photoPath != null) {
      map['photo_path'] = Variable<String>(photoPath);
    }
    {
      map['location'] = Variable<String>(
        $PlantsTableTable.$converterlocation.toSql(location),
      );
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PlantsTableCompanion toCompanion(bool nullToAbsent) {
    return PlantsTableCompanion(
      id: Value(id),
      nickname: Value(nickname),
      speciesId: Value(speciesId),
      photoPath: photoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(photoPath),
      location: Value(location),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory PlantRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlantRow(
      id: serializer.fromJson<String>(json['id']),
      nickname: serializer.fromJson<String>(json['nickname']),
      speciesId: serializer.fromJson<String>(json['speciesId']),
      photoPath: serializer.fromJson<String?>(json['photoPath']),
      location: $PlantsTableTable.$converterlocation.fromJson(
        serializer.fromJson<String>(json['location']),
      ),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'nickname': serializer.toJson<String>(nickname),
      'speciesId': serializer.toJson<String>(speciesId),
      'photoPath': serializer.toJson<String?>(photoPath),
      'location': serializer.toJson<String>(
        $PlantsTableTable.$converterlocation.toJson(location),
      ),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  PlantRow copyWith({
    String? id,
    String? nickname,
    String? speciesId,
    Value<String?> photoPath = const Value.absent(),
    PlantLocation? location,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => PlantRow(
    id: id ?? this.id,
    nickname: nickname ?? this.nickname,
    speciesId: speciesId ?? this.speciesId,
    photoPath: photoPath.present ? photoPath.value : this.photoPath,
    location: location ?? this.location,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  PlantRow copyWithCompanion(PlantsTableCompanion data) {
    return PlantRow(
      id: data.id.present ? data.id.value : this.id,
      nickname: data.nickname.present ? data.nickname.value : this.nickname,
      speciesId: data.speciesId.present ? data.speciesId.value : this.speciesId,
      photoPath: data.photoPath.present ? data.photoPath.value : this.photoPath,
      location: data.location.present ? data.location.value : this.location,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlantRow(')
          ..write('id: $id, ')
          ..write('nickname: $nickname, ')
          ..write('speciesId: $speciesId, ')
          ..write('photoPath: $photoPath, ')
          ..write('location: $location, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    nickname,
    speciesId,
    photoPath,
    location,
    notes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlantRow &&
          other.id == this.id &&
          other.nickname == this.nickname &&
          other.speciesId == this.speciesId &&
          other.photoPath == this.photoPath &&
          other.location == this.location &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PlantsTableCompanion extends UpdateCompanion<PlantRow> {
  final Value<String> id;
  final Value<String> nickname;
  final Value<String> speciesId;
  final Value<String?> photoPath;
  final Value<PlantLocation> location;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const PlantsTableCompanion({
    this.id = const Value.absent(),
    this.nickname = const Value.absent(),
    this.speciesId = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.location = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlantsTableCompanion.insert({
    required String id,
    required String nickname,
    required String speciesId,
    this.photoPath = const Value.absent(),
    required PlantLocation location,
    this.notes = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       nickname = Value(nickname),
       speciesId = Value(speciesId),
       location = Value(location),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<PlantRow> custom({
    Expression<String>? id,
    Expression<String>? nickname,
    Expression<String>? speciesId,
    Expression<String>? photoPath,
    Expression<String>? location,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nickname != null) 'nickname': nickname,
      if (speciesId != null) 'species_id': speciesId,
      if (photoPath != null) 'photo_path': photoPath,
      if (location != null) 'location': location,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlantsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? nickname,
    Value<String>? speciesId,
    Value<String?>? photoPath,
    Value<PlantLocation>? location,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return PlantsTableCompanion(
      id: id ?? this.id,
      nickname: nickname ?? this.nickname,
      speciesId: speciesId ?? this.speciesId,
      photoPath: photoPath ?? this.photoPath,
      location: location ?? this.location,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (nickname.present) {
      map['nickname'] = Variable<String>(nickname.value);
    }
    if (speciesId.present) {
      map['species_id'] = Variable<String>(speciesId.value);
    }
    if (photoPath.present) {
      map['photo_path'] = Variable<String>(photoPath.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(
        $PlantsTableTable.$converterlocation.toSql(location.value),
      );
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlantsTableCompanion(')
          ..write('id: $id, ')
          ..write('nickname: $nickname, ')
          ..write('speciesId: $speciesId, ')
          ..write('photoPath: $photoPath, ')
          ..write('location: $location, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SpeciesTableTable speciesTable = $SpeciesTableTable(this);
  late final $PlantsTableTable plantsTable = $PlantsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    speciesTable,
    plantsTable,
  ];
}

typedef $$SpeciesTableTableCreateCompanionBuilder =
    SpeciesTableCompanion Function({
      required String id,
      required String commonNameEn,
      required String commonNameEs,
      required String scientificName,
      required String descriptionEn,
      required String descriptionEs,
      required int wateringFrequencyDays,
      required int fertilizingFrequencyDays,
      required LightRequirement lightRequirement,
      Value<int> rowid,
    });
typedef $$SpeciesTableTableUpdateCompanionBuilder =
    SpeciesTableCompanion Function({
      Value<String> id,
      Value<String> commonNameEn,
      Value<String> commonNameEs,
      Value<String> scientificName,
      Value<String> descriptionEn,
      Value<String> descriptionEs,
      Value<int> wateringFrequencyDays,
      Value<int> fertilizingFrequencyDays,
      Value<LightRequirement> lightRequirement,
      Value<int> rowid,
    });

final class $$SpeciesTableTableReferences
    extends BaseReferences<_$AppDatabase, $SpeciesTableTable, SpeciesRow> {
  $$SpeciesTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PlantsTableTable, List<PlantRow>>
  _plantsTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.plantsTable,
    aliasName: 'species__id__plants__species_id',
  );

  $$PlantsTableTableProcessedTableManager get plantsTableRefs {
    final manager = $$PlantsTableTableTableManager(
      $_db,
      $_db.plantsTable,
    ).filter((f) => f.speciesId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_plantsTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SpeciesTableTableFilterComposer
    extends Composer<_$AppDatabase, $SpeciesTableTable> {
  $$SpeciesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get commonNameEn => $composableBuilder(
    column: $table.commonNameEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get commonNameEs => $composableBuilder(
    column: $table.commonNameEs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get scientificName => $composableBuilder(
    column: $table.scientificName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descriptionEn => $composableBuilder(
    column: $table.descriptionEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descriptionEs => $composableBuilder(
    column: $table.descriptionEs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get wateringFrequencyDays => $composableBuilder(
    column: $table.wateringFrequencyDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fertilizingFrequencyDays => $composableBuilder(
    column: $table.fertilizingFrequencyDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<LightRequirement, LightRequirement, String>
  get lightRequirement => $composableBuilder(
    column: $table.lightRequirement,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  Expression<bool> plantsTableRefs(
    Expression<bool> Function($$PlantsTableTableFilterComposer f) f,
  ) {
    final $$PlantsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.plantsTable,
      getReferencedColumn: (t) => t.speciesId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlantsTableTableFilterComposer(
            $db: $db,
            $table: $db.plantsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SpeciesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SpeciesTableTable> {
  $$SpeciesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get commonNameEn => $composableBuilder(
    column: $table.commonNameEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get commonNameEs => $composableBuilder(
    column: $table.commonNameEs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get scientificName => $composableBuilder(
    column: $table.scientificName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descriptionEn => $composableBuilder(
    column: $table.descriptionEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descriptionEs => $composableBuilder(
    column: $table.descriptionEs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get wateringFrequencyDays => $composableBuilder(
    column: $table.wateringFrequencyDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fertilizingFrequencyDays => $composableBuilder(
    column: $table.fertilizingFrequencyDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lightRequirement => $composableBuilder(
    column: $table.lightRequirement,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SpeciesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SpeciesTableTable> {
  $$SpeciesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get commonNameEn => $composableBuilder(
    column: $table.commonNameEn,
    builder: (column) => column,
  );

  GeneratedColumn<String> get commonNameEs => $composableBuilder(
    column: $table.commonNameEs,
    builder: (column) => column,
  );

  GeneratedColumn<String> get scientificName => $composableBuilder(
    column: $table.scientificName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get descriptionEn => $composableBuilder(
    column: $table.descriptionEn,
    builder: (column) => column,
  );

  GeneratedColumn<String> get descriptionEs => $composableBuilder(
    column: $table.descriptionEs,
    builder: (column) => column,
  );

  GeneratedColumn<int> get wateringFrequencyDays => $composableBuilder(
    column: $table.wateringFrequencyDays,
    builder: (column) => column,
  );

  GeneratedColumn<int> get fertilizingFrequencyDays => $composableBuilder(
    column: $table.fertilizingFrequencyDays,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<LightRequirement, String>
  get lightRequirement => $composableBuilder(
    column: $table.lightRequirement,
    builder: (column) => column,
  );

  Expression<T> plantsTableRefs<T extends Object>(
    Expression<T> Function($$PlantsTableTableAnnotationComposer a) f,
  ) {
    final $$PlantsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.plantsTable,
      getReferencedColumn: (t) => t.speciesId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlantsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.plantsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SpeciesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SpeciesTableTable,
          SpeciesRow,
          $$SpeciesTableTableFilterComposer,
          $$SpeciesTableTableOrderingComposer,
          $$SpeciesTableTableAnnotationComposer,
          $$SpeciesTableTableCreateCompanionBuilder,
          $$SpeciesTableTableUpdateCompanionBuilder,
          (SpeciesRow, $$SpeciesTableTableReferences),
          SpeciesRow,
          PrefetchHooks Function({bool plantsTableRefs})
        > {
  $$SpeciesTableTableTableManager(_$AppDatabase db, $SpeciesTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SpeciesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SpeciesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SpeciesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> commonNameEn = const Value.absent(),
                Value<String> commonNameEs = const Value.absent(),
                Value<String> scientificName = const Value.absent(),
                Value<String> descriptionEn = const Value.absent(),
                Value<String> descriptionEs = const Value.absent(),
                Value<int> wateringFrequencyDays = const Value.absent(),
                Value<int> fertilizingFrequencyDays = const Value.absent(),
                Value<LightRequirement> lightRequirement = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SpeciesTableCompanion(
                id: id,
                commonNameEn: commonNameEn,
                commonNameEs: commonNameEs,
                scientificName: scientificName,
                descriptionEn: descriptionEn,
                descriptionEs: descriptionEs,
                wateringFrequencyDays: wateringFrequencyDays,
                fertilizingFrequencyDays: fertilizingFrequencyDays,
                lightRequirement: lightRequirement,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String commonNameEn,
                required String commonNameEs,
                required String scientificName,
                required String descriptionEn,
                required String descriptionEs,
                required int wateringFrequencyDays,
                required int fertilizingFrequencyDays,
                required LightRequirement lightRequirement,
                Value<int> rowid = const Value.absent(),
              }) => SpeciesTableCompanion.insert(
                id: id,
                commonNameEn: commonNameEn,
                commonNameEs: commonNameEs,
                scientificName: scientificName,
                descriptionEn: descriptionEn,
                descriptionEs: descriptionEs,
                wateringFrequencyDays: wateringFrequencyDays,
                fertilizingFrequencyDays: fertilizingFrequencyDays,
                lightRequirement: lightRequirement,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SpeciesTableTable, SpeciesRow>(table),
                  $$SpeciesTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({plantsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (plantsTableRefs) db.plantsTable],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (plantsTableRefs)
                    await $_getPrefetchedDataByColumns<
                      SpeciesRow,
                      $SpeciesTableTable,
                      PlantRow,
                      $PlantsTableTable
                    >(
                      currentTable: table,
                      referencedTable: $$SpeciesTableTableReferences
                          ._plantsTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$SpeciesTableTableReferences(
                            db,
                            table,
                            p0,
                          ).plantsTableRefs,
                      currentColumn: 'id',
                      referencedColumn: 'species_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SpeciesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SpeciesTableTable,
      SpeciesRow,
      $$SpeciesTableTableFilterComposer,
      $$SpeciesTableTableOrderingComposer,
      $$SpeciesTableTableAnnotationComposer,
      $$SpeciesTableTableCreateCompanionBuilder,
      $$SpeciesTableTableUpdateCompanionBuilder,
      (SpeciesRow, $$SpeciesTableTableReferences),
      SpeciesRow,
      PrefetchHooks Function({bool plantsTableRefs})
    >;
typedef $$PlantsTableTableCreateCompanionBuilder =
    PlantsTableCompanion Function({
      required String id,
      required String nickname,
      required String speciesId,
      Value<String?> photoPath,
      required PlantLocation location,
      Value<String?> notes,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$PlantsTableTableUpdateCompanionBuilder =
    PlantsTableCompanion Function({
      Value<String> id,
      Value<String> nickname,
      Value<String> speciesId,
      Value<String?> photoPath,
      Value<PlantLocation> location,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$PlantsTableTableReferences
    extends BaseReferences<_$AppDatabase, $PlantsTableTable, PlantRow> {
  $$PlantsTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SpeciesTableTable _speciesIdTable(_$AppDatabase db) =>
      db.speciesTable.createAlias('plants__species_id__species__id');

  $$SpeciesTableTableProcessedTableManager get speciesId {
    final $_column = $_itemColumn<String>('species_id')!;

    final manager = $$SpeciesTableTableTableManager(
      $_db,
      $_db.speciesTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_speciesIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PlantsTableTableFilterComposer
    extends Composer<_$AppDatabase, $PlantsTableTable> {
  $$PlantsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nickname => $composableBuilder(
    column: $table.nickname,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<PlantLocation, PlantLocation, String>
  get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$SpeciesTableTableFilterComposer get speciesId {
    final $$SpeciesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.speciesId,
      referencedTable: $db.speciesTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpeciesTableTableFilterComposer(
            $db: $db,
            $table: $db.speciesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PlantsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PlantsTableTable> {
  $$PlantsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nickname => $composableBuilder(
    column: $table.nickname,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$SpeciesTableTableOrderingComposer get speciesId {
    final $$SpeciesTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.speciesId,
      referencedTable: $db.speciesTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpeciesTableTableOrderingComposer(
            $db: $db,
            $table: $db.speciesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PlantsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlantsTableTable> {
  $$PlantsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nickname =>
      $composableBuilder(column: $table.nickname, builder: (column) => column);

  GeneratedColumn<String> get photoPath =>
      $composableBuilder(column: $table.photoPath, builder: (column) => column);

  GeneratedColumnWithTypeConverter<PlantLocation, String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$SpeciesTableTableAnnotationComposer get speciesId {
    final $$SpeciesTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.speciesId,
      referencedTable: $db.speciesTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpeciesTableTableAnnotationComposer(
            $db: $db,
            $table: $db.speciesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PlantsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlantsTableTable,
          PlantRow,
          $$PlantsTableTableFilterComposer,
          $$PlantsTableTableOrderingComposer,
          $$PlantsTableTableAnnotationComposer,
          $$PlantsTableTableCreateCompanionBuilder,
          $$PlantsTableTableUpdateCompanionBuilder,
          (PlantRow, $$PlantsTableTableReferences),
          PlantRow,
          PrefetchHooks Function({bool speciesId})
        > {
  $$PlantsTableTableTableManager(_$AppDatabase db, $PlantsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlantsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlantsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlantsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> nickname = const Value.absent(),
                Value<String> speciesId = const Value.absent(),
                Value<String?> photoPath = const Value.absent(),
                Value<PlantLocation> location = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlantsTableCompanion(
                id: id,
                nickname: nickname,
                speciesId: speciesId,
                photoPath: photoPath,
                location: location,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String nickname,
                required String speciesId,
                Value<String?> photoPath = const Value.absent(),
                required PlantLocation location,
                Value<String?> notes = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => PlantsTableCompanion.insert(
                id: id,
                nickname: nickname,
                speciesId: speciesId,
                photoPath: photoPath,
                location: location,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PlantsTableTable, PlantRow>(table),
                  $$PlantsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({speciesId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (speciesId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.speciesId,
                        referencedTable: $$PlantsTableTableReferences
                            ._speciesIdTable(db),
                        referencedColumn: $$PlantsTableTableReferences
                            ._speciesIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PlantsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlantsTableTable,
      PlantRow,
      $$PlantsTableTableFilterComposer,
      $$PlantsTableTableOrderingComposer,
      $$PlantsTableTableAnnotationComposer,
      $$PlantsTableTableCreateCompanionBuilder,
      $$PlantsTableTableUpdateCompanionBuilder,
      (PlantRow, $$PlantsTableTableReferences),
      PlantRow,
      PrefetchHooks Function({bool speciesId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SpeciesTableTableTableManager get speciesTable =>
      $$SpeciesTableTableTableManager(_db, _db.speciesTable);
  $$PlantsTableTableTableManager get plantsTable =>
      $$PlantsTableTableTableManager(_db, _db.plantsTable);
}
