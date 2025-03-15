// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
mixin $SharedDataTableToColumns implements Insertable<SharedDataData> {
  bool get isLogined;
  int? get personId;
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['is_logined'] = Variable<bool>(isLogined);
    if (!nullToAbsent || personId != null) {
      map['person_id'] = Variable<int>(personId);
    }
    return map;
  }
}

class $SharedDataTable extends SharedData
    with TableInfo<$SharedDataTable, SharedDataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SharedDataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _isLoginedMeta = const VerificationMeta(
    'isLogined',
  );
  @override
  late final GeneratedColumn<bool> isLogined = GeneratedColumn<bool>(
    'is_logined',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_logined" IN (0, 1))',
    ),
  );
  static const VerificationMeta _personIdMeta = const VerificationMeta(
    'personId',
  );
  @override
  late final GeneratedColumn<int> personId = GeneratedColumn<int>(
    'person_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [isLogined, personId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shared_data';
  @override
  VerificationContext validateIntegrity(
    Insertable<SharedDataData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('is_logined')) {
      context.handle(
        _isLoginedMeta,
        isLogined.isAcceptableOrUnknown(data['is_logined']!, _isLoginedMeta),
      );
    } else if (isInserting) {
      context.missing(_isLoginedMeta);
    }
    if (data.containsKey('person_id')) {
      context.handle(
        _personIdMeta,
        personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  SharedDataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SharedDataData(
      isLogined:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_logined'],
          )!,
      personId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}person_id'],
      ),
    );
  }

  @override
  $SharedDataTable createAlias(String alias) {
    return $SharedDataTable(attachedDatabase, alias);
  }
}

class SharedDataData extends DataClass with $SharedDataTableToColumns {
  @override
  final bool isLogined;
  @override
  final int? personId;
  const SharedDataData({required this.isLogined, this.personId});
  SharedDataCompanion toCompanion(bool nullToAbsent) {
    return SharedDataCompanion(
      isLogined: Value(isLogined),
      personId:
          personId == null && nullToAbsent
              ? const Value.absent()
              : Value(personId),
    );
  }

  factory SharedDataData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SharedDataData(
      isLogined: serializer.fromJson<bool>(json['isLogined']),
      personId: serializer.fromJson<int?>(json['personId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'isLogined': serializer.toJson<bool>(isLogined),
      'personId': serializer.toJson<int?>(personId),
    };
  }

  SharedDataData copyWith({
    bool? isLogined,
    Value<int?> personId = const Value.absent(),
  }) => SharedDataData(
    isLogined: isLogined ?? this.isLogined,
    personId: personId.present ? personId.value : this.personId,
  );
  SharedDataData copyWithCompanion(SharedDataCompanion data) {
    return SharedDataData(
      isLogined: data.isLogined.present ? data.isLogined.value : this.isLogined,
      personId: data.personId.present ? data.personId.value : this.personId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SharedDataData(')
          ..write('isLogined: $isLogined, ')
          ..write('personId: $personId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(isLogined, personId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SharedDataData &&
          other.isLogined == this.isLogined &&
          other.personId == this.personId);
}

class SharedDataCompanion extends UpdateCompanion<SharedDataData> {
  final Value<bool> isLogined;
  final Value<int?> personId;
  final Value<int> rowid;
  const SharedDataCompanion({
    this.isLogined = const Value.absent(),
    this.personId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SharedDataCompanion.insert({
    required bool isLogined,
    this.personId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : isLogined = Value(isLogined);
  static Insertable<SharedDataData> custom({
    Expression<bool>? isLogined,
    Expression<int>? personId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (isLogined != null) 'is_logined': isLogined,
      if (personId != null) 'person_id': personId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SharedDataCompanion copyWith({
    Value<bool>? isLogined,
    Value<int?>? personId,
    Value<int>? rowid,
  }) {
    return SharedDataCompanion(
      isLogined: isLogined ?? this.isLogined,
      personId: personId ?? this.personId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (isLogined.present) {
      map['is_logined'] = Variable<bool>(isLogined.value);
    }
    if (personId.present) {
      map['person_id'] = Variable<int>(personId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SharedDataCompanion(')
          ..write('isLogined: $isLogined, ')
          ..write('personId: $personId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

mixin $PersonTblTableToColumns implements Insertable<Person> {
  int? get id;
  String get name;
  bool get isUserLoged;
  PhoneNumber? get contactNumber;
  String? get email;
  String? get password;
  Uint8List? get imageUrl;
  double get owedAmount;
  DateTime? get createdAt;
  DateTime? get updatedAt;
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['name'] = Variable<String>(name);
    map['is_user_loged'] = Variable<bool>(isUserLoged);
    if (!nullToAbsent || contactNumber != null) {
      map['contact_number'] = Variable<String>(
        $PersonTblTable.$convertercontactNumbern.toSql(contactNumber),
      );
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || password != null) {
      map['password'] = Variable<String>(password);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<Uint8List>(imageUrl);
    }
    map['owed_amount'] = Variable<double>(owedAmount);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }
}

class $PersonTblTable extends PersonTbl
    with TableInfo<$PersonTblTable, Person> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PersonTblTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    true,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isUserLogedMeta = const VerificationMeta(
    'isUserLoged',
  );
  @override
  late final GeneratedColumn<bool> isUserLoged = GeneratedColumn<bool>(
    'is_user_loged',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_user_loged" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<PhoneNumber?, String>
  contactNumber = GeneratedColumn<String>(
    'contact_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  ).withConverter<PhoneNumber?>($PersonTblTable.$convertercontactNumbern);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _passwordMeta = const VerificationMeta(
    'password',
  );
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
    'password',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<Uint8List> imageUrl = GeneratedColumn<Uint8List>(
    'image_url',
    aliasedName,
    true,
    type: DriftSqlType.blob,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _owedAmountMeta = const VerificationMeta(
    'owedAmount',
  );
  @override
  late final GeneratedColumn<double> owedAmount = GeneratedColumn<double>(
    'owed_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    isUserLoged,
    contactNumber,
    email,
    password,
    imageUrl,
    owedAmount,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'person_tbl';
  @override
  VerificationContext validateIntegrity(
    Insertable<Person> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_user_loged')) {
      context.handle(
        _isUserLogedMeta,
        isUserLoged.isAcceptableOrUnknown(
          data['is_user_loged']!,
          _isUserLogedMeta,
        ),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('password')) {
      context.handle(
        _passwordMeta,
        password.isAcceptableOrUnknown(data['password']!, _passwordMeta),
      );
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    if (data.containsKey('owed_amount')) {
      context.handle(
        _owedAmountMeta,
        owedAmount.isAcceptableOrUnknown(data['owed_amount']!, _owedAmountMeta),
      );
    } else if (isInserting) {
      context.missing(_owedAmountMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Person map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Person(
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      contactNumber: $PersonTblTable.$convertercontactNumbern.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}contact_number'],
        ),
      ),
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      password: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password'],
      ),
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.blob,
        data['${effectivePrefix}image_url'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      isUserLoged:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_user_loged'],
          )!,
      owedAmount:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}owed_amount'],
          )!,
    );
  }

  @override
  $PersonTblTable createAlias(String alias) {
    return $PersonTblTable(attachedDatabase, alias);
  }

  static TypeConverter<PhoneNumber, String> $convertercontactNumber =
      PhoneNumberConverter();
  static TypeConverter<PhoneNumber?, String?> $convertercontactNumbern =
      NullAwareTypeConverter.wrap($convertercontactNumber);
}

class PersonTblCompanion extends UpdateCompanion<Person> {
  final Value<int?> id;
  final Value<String> name;
  final Value<bool> isUserLoged;
  final Value<PhoneNumber?> contactNumber;
  final Value<String?> email;
  final Value<String?> password;
  final Value<Uint8List?> imageUrl;
  final Value<double> owedAmount;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  const PersonTblCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.isUserLoged = const Value.absent(),
    this.contactNumber = const Value.absent(),
    this.email = const Value.absent(),
    this.password = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.owedAmount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  PersonTblCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.isUserLoged = const Value.absent(),
    this.contactNumber = const Value.absent(),
    this.email = const Value.absent(),
    this.password = const Value.absent(),
    this.imageUrl = const Value.absent(),
    required double owedAmount,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name),
       owedAmount = Value(owedAmount);
  static Insertable<Person> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<bool>? isUserLoged,
    Expression<String>? contactNumber,
    Expression<String>? email,
    Expression<String>? password,
    Expression<Uint8List>? imageUrl,
    Expression<double>? owedAmount,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (isUserLoged != null) 'is_user_loged': isUserLoged,
      if (contactNumber != null) 'contact_number': contactNumber,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
      if (imageUrl != null) 'image_url': imageUrl,
      if (owedAmount != null) 'owed_amount': owedAmount,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  PersonTblCompanion copyWith({
    Value<int?>? id,
    Value<String>? name,
    Value<bool>? isUserLoged,
    Value<PhoneNumber?>? contactNumber,
    Value<String?>? email,
    Value<String?>? password,
    Value<Uint8List?>? imageUrl,
    Value<double>? owedAmount,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return PersonTblCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      isUserLoged: isUserLoged ?? this.isUserLoged,
      contactNumber: contactNumber ?? this.contactNumber,
      email: email ?? this.email,
      password: password ?? this.password,
      imageUrl: imageUrl ?? this.imageUrl,
      owedAmount: owedAmount ?? this.owedAmount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isUserLoged.present) {
      map['is_user_loged'] = Variable<bool>(isUserLoged.value);
    }
    if (contactNumber.present) {
      map['contact_number'] = Variable<String>(
        $PersonTblTable.$convertercontactNumbern.toSql(contactNumber.value),
      );
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<Uint8List>(imageUrl.value);
    }
    if (owedAmount.present) {
      map['owed_amount'] = Variable<double>(owedAmount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonTblCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isUserLoged: $isUserLoged, ')
          ..write('contactNumber: $contactNumber, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('owedAmount: $owedAmount, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class _$PersonInsertable implements Insertable<Person> {
  Person _object;
  _$PersonInsertable(this._object);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return PersonTblCompanion(
      id: Value(_object.id),
      name: Value(_object.name),
      isUserLoged: Value(_object.isUserLoged),
      contactNumber: Value(_object.contactNumber),
      email: Value(_object.email),
      password: Value(_object.password),
      imageUrl: Value(_object.imageUrl),
      owedAmount: Value(_object.owedAmount),
      createdAt: Value(_object.createdAt),
      updatedAt: Value(_object.updatedAt),
    ).toColumns(false);
  }
}

extension PersonToInsertable on Person {
  _$PersonInsertable toInsertable() {
    return _$PersonInsertable(this);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SharedDataTable sharedData = $SharedDataTable(this);
  late final $PersonTblTable personTbl = $PersonTblTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [sharedData, personTbl];
}

typedef $$SharedDataTableCreateCompanionBuilder =
    SharedDataCompanion Function({
      required bool isLogined,
      Value<int?> personId,
      Value<int> rowid,
    });
typedef $$SharedDataTableUpdateCompanionBuilder =
    SharedDataCompanion Function({
      Value<bool> isLogined,
      Value<int?> personId,
      Value<int> rowid,
    });

class $$SharedDataTableFilterComposer
    extends Composer<_$AppDatabase, $SharedDataTable> {
  $$SharedDataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<bool> get isLogined => $composableBuilder(
    column: $table.isLogined,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get personId => $composableBuilder(
    column: $table.personId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SharedDataTableOrderingComposer
    extends Composer<_$AppDatabase, $SharedDataTable> {
  $$SharedDataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<bool> get isLogined => $composableBuilder(
    column: $table.isLogined,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get personId => $composableBuilder(
    column: $table.personId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SharedDataTableAnnotationComposer
    extends Composer<_$AppDatabase, $SharedDataTable> {
  $$SharedDataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<bool> get isLogined =>
      $composableBuilder(column: $table.isLogined, builder: (column) => column);

  GeneratedColumn<int> get personId =>
      $composableBuilder(column: $table.personId, builder: (column) => column);
}

class $$SharedDataTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SharedDataTable,
          SharedDataData,
          $$SharedDataTableFilterComposer,
          $$SharedDataTableOrderingComposer,
          $$SharedDataTableAnnotationComposer,
          $$SharedDataTableCreateCompanionBuilder,
          $$SharedDataTableUpdateCompanionBuilder,
          (
            SharedDataData,
            BaseReferences<_$AppDatabase, $SharedDataTable, SharedDataData>,
          ),
          SharedDataData,
          PrefetchHooks Function()
        > {
  $$SharedDataTableTableManager(_$AppDatabase db, $SharedDataTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$SharedDataTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$SharedDataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$SharedDataTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<bool> isLogined = const Value.absent(),
                Value<int?> personId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SharedDataCompanion(
                isLogined: isLogined,
                personId: personId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required bool isLogined,
                Value<int?> personId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SharedDataCompanion.insert(
                isLogined: isLogined,
                personId: personId,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SharedDataTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SharedDataTable,
      SharedDataData,
      $$SharedDataTableFilterComposer,
      $$SharedDataTableOrderingComposer,
      $$SharedDataTableAnnotationComposer,
      $$SharedDataTableCreateCompanionBuilder,
      $$SharedDataTableUpdateCompanionBuilder,
      (
        SharedDataData,
        BaseReferences<_$AppDatabase, $SharedDataTable, SharedDataData>,
      ),
      SharedDataData,
      PrefetchHooks Function()
    >;
typedef $$PersonTblTableCreateCompanionBuilder =
    PersonTblCompanion Function({
      Value<int?> id,
      required String name,
      Value<bool> isUserLoged,
      Value<PhoneNumber?> contactNumber,
      Value<String?> email,
      Value<String?> password,
      Value<Uint8List?> imageUrl,
      required double owedAmount,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$PersonTblTableUpdateCompanionBuilder =
    PersonTblCompanion Function({
      Value<int?> id,
      Value<String> name,
      Value<bool> isUserLoged,
      Value<PhoneNumber?> contactNumber,
      Value<String?> email,
      Value<String?> password,
      Value<Uint8List?> imageUrl,
      Value<double> owedAmount,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });

class $$PersonTblTableFilterComposer
    extends Composer<_$AppDatabase, $PersonTblTable> {
  $$PersonTblTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isUserLoged => $composableBuilder(
    column: $table.isUserLoged,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<PhoneNumber?, PhoneNumber, String>
  get contactNumber => $composableBuilder(
    column: $table.contactNumber,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<Uint8List> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get owedAmount => $composableBuilder(
    column: $table.owedAmount,
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
}

class $$PersonTblTableOrderingComposer
    extends Composer<_$AppDatabase, $PersonTblTable> {
  $$PersonTblTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isUserLoged => $composableBuilder(
    column: $table.isUserLoged,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contactNumber => $composableBuilder(
    column: $table.contactNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get owedAmount => $composableBuilder(
    column: $table.owedAmount,
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
}

class $$PersonTblTableAnnotationComposer
    extends Composer<_$AppDatabase, $PersonTblTable> {
  $$PersonTblTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get isUserLoged => $composableBuilder(
    column: $table.isUserLoged,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<PhoneNumber?, String> get contactNumber =>
      $composableBuilder(
        column: $table.contactNumber,
        builder: (column) => column,
      );

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<Uint8List> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<double> get owedAmount => $composableBuilder(
    column: $table.owedAmount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$PersonTblTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PersonTblTable,
          Person,
          $$PersonTblTableFilterComposer,
          $$PersonTblTableOrderingComposer,
          $$PersonTblTableAnnotationComposer,
          $$PersonTblTableCreateCompanionBuilder,
          $$PersonTblTableUpdateCompanionBuilder,
          (Person, BaseReferences<_$AppDatabase, $PersonTblTable, Person>),
          Person,
          PrefetchHooks Function()
        > {
  $$PersonTblTableTableManager(_$AppDatabase db, $PersonTblTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$PersonTblTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$PersonTblTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$PersonTblTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int?> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<bool> isUserLoged = const Value.absent(),
                Value<PhoneNumber?> contactNumber = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> password = const Value.absent(),
                Value<Uint8List?> imageUrl = const Value.absent(),
                Value<double> owedAmount = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => PersonTblCompanion(
                id: id,
                name: name,
                isUserLoged: isUserLoged,
                contactNumber: contactNumber,
                email: email,
                password: password,
                imageUrl: imageUrl,
                owedAmount: owedAmount,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int?> id = const Value.absent(),
                required String name,
                Value<bool> isUserLoged = const Value.absent(),
                Value<PhoneNumber?> contactNumber = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> password = const Value.absent(),
                Value<Uint8List?> imageUrl = const Value.absent(),
                required double owedAmount,
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => PersonTblCompanion.insert(
                id: id,
                name: name,
                isUserLoged: isUserLoged,
                contactNumber: contactNumber,
                email: email,
                password: password,
                imageUrl: imageUrl,
                owedAmount: owedAmount,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PersonTblTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PersonTblTable,
      Person,
      $$PersonTblTableFilterComposer,
      $$PersonTblTableOrderingComposer,
      $$PersonTblTableAnnotationComposer,
      $$PersonTblTableCreateCompanionBuilder,
      $$PersonTblTableUpdateCompanionBuilder,
      (Person, BaseReferences<_$AppDatabase, $PersonTblTable, Person>),
      Person,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SharedDataTableTableManager get sharedData =>
      $$SharedDataTableTableManager(_db, _db.sharedData);
  $$PersonTblTableTableManager get personTbl =>
      $$PersonTblTableTableManager(_db, _db.personTbl);
}
