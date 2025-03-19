// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
mixin $SharedDataTableToColumns implements Insertable<SharedDataData> {
  int get id;
  bool get isLogined;
  int? get personId;
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
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
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
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
  List<GeneratedColumn> get $columns => [id, isLogined, personId];
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
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SharedDataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SharedDataData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
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
  final int id;
  @override
  final bool isLogined;
  @override
  final int? personId;
  const SharedDataData({
    required this.id,
    required this.isLogined,
    this.personId,
  });
  SharedDataCompanion toCompanion(bool nullToAbsent) {
    return SharedDataCompanion(
      id: Value(id),
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
      id: serializer.fromJson<int>(json['id']),
      isLogined: serializer.fromJson<bool>(json['isLogined']),
      personId: serializer.fromJson<int?>(json['personId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'isLogined': serializer.toJson<bool>(isLogined),
      'personId': serializer.toJson<int?>(personId),
    };
  }

  SharedDataData copyWith({
    int? id,
    bool? isLogined,
    Value<int?> personId = const Value.absent(),
  }) => SharedDataData(
    id: id ?? this.id,
    isLogined: isLogined ?? this.isLogined,
    personId: personId.present ? personId.value : this.personId,
  );
  SharedDataData copyWithCompanion(SharedDataCompanion data) {
    return SharedDataData(
      id: data.id.present ? data.id.value : this.id,
      isLogined: data.isLogined.present ? data.isLogined.value : this.isLogined,
      personId: data.personId.present ? data.personId.value : this.personId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SharedDataData(')
          ..write('id: $id, ')
          ..write('isLogined: $isLogined, ')
          ..write('personId: $personId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, isLogined, personId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SharedDataData &&
          other.id == this.id &&
          other.isLogined == this.isLogined &&
          other.personId == this.personId);
}

class SharedDataCompanion extends UpdateCompanion<SharedDataData> {
  final Value<int> id;
  final Value<bool> isLogined;
  final Value<int?> personId;
  const SharedDataCompanion({
    this.id = const Value.absent(),
    this.isLogined = const Value.absent(),
    this.personId = const Value.absent(),
  });
  SharedDataCompanion.insert({
    this.id = const Value.absent(),
    required bool isLogined,
    this.personId = const Value.absent(),
  }) : isLogined = Value(isLogined);
  static Insertable<SharedDataData> custom({
    Expression<int>? id,
    Expression<bool>? isLogined,
    Expression<int>? personId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (isLogined != null) 'is_logined': isLogined,
      if (personId != null) 'person_id': personId,
    });
  }

  SharedDataCompanion copyWith({
    Value<int>? id,
    Value<bool>? isLogined,
    Value<int?>? personId,
  }) {
    return SharedDataCompanion(
      id: id ?? this.id,
      isLogined: isLogined ?? this.isLogined,
      personId: personId ?? this.personId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (isLogined.present) {
      map['is_logined'] = Variable<bool>(isLogined.value);
    }
    if (personId.present) {
      map['person_id'] = Variable<int>(personId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SharedDataCompanion(')
          ..write('id: $id, ')
          ..write('isLogined: $isLogined, ')
          ..write('personId: $personId')
          ..write(')'))
        .toString();
  }
}

mixin $PersonTblTableToColumns implements Insertable<Person> {
  int? get id;
  String get name;
  PhoneNumber get phoneNumber;
  String? get email;
  String? get password;
  Uint8List? get profileImage;
  double get amount;
  DateTime? get createdAt;
  DateTime? get updatedAt;
  String? get about;
  bool get agreeToTerms;
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['name'] = Variable<String>(name);
    {
      map['phone_number'] = Variable<String>(
        $PersonTblTable.$converterphoneNumber.toSql(phoneNumber),
      );
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || password != null) {
      map['password'] = Variable<String>(password);
    }
    if (!nullToAbsent || profileImage != null) {
      map['profile_image'] = Variable<Uint8List>(profileImage);
    }
    map['amount'] = Variable<double>(amount);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    if (!nullToAbsent || about != null) {
      map['about'] = Variable<String>(about);
    }
    map['agree_to_terms'] = Variable<bool>(agreeToTerms);
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
  @override
  late final GeneratedColumnWithTypeConverter<PhoneNumber, String> phoneNumber =
      GeneratedColumn<String>(
        'phone_number',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
      ).withConverter<PhoneNumber>($PersonTblTable.$converterphoneNumber);
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
  static const VerificationMeta _profileImageMeta = const VerificationMeta(
    'profileImage',
  );
  @override
  late final GeneratedColumn<Uint8List> profileImage =
      GeneratedColumn<Uint8List>(
        'profile_image',
        aliasedName,
        true,
        type: DriftSqlType.blob,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: Constant(0.0),
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
  static const VerificationMeta _aboutMeta = const VerificationMeta('about');
  @override
  late final GeneratedColumn<String> about = GeneratedColumn<String>(
    'about',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _agreeToTermsMeta = const VerificationMeta(
    'agreeToTerms',
  );
  @override
  late final GeneratedColumn<bool> agreeToTerms = GeneratedColumn<bool>(
    'agree_to_terms',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("agree_to_terms" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    phoneNumber,
    email,
    password,
    profileImage,
    amount,
    createdAt,
    updatedAt,
    about,
    agreeToTerms,
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
    if (data.containsKey('profile_image')) {
      context.handle(
        _profileImageMeta,
        profileImage.isAcceptableOrUnknown(
          data['profile_image']!,
          _profileImageMeta,
        ),
      );
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
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
    if (data.containsKey('about')) {
      context.handle(
        _aboutMeta,
        about.isAcceptableOrUnknown(data['about']!, _aboutMeta),
      );
    }
    if (data.containsKey('agree_to_terms')) {
      context.handle(
        _agreeToTermsMeta,
        agreeToTerms.isAcceptableOrUnknown(
          data['agree_to_terms']!,
          _agreeToTermsMeta,
        ),
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
      phoneNumber: $PersonTblTable.$converterphoneNumber.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}phone_number'],
        )!,
      ),
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      about: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}about'],
      ),
      password: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password'],
      ),
      profileImage: attachedDatabase.typeMapping.read(
        DriftSqlType.blob,
        data['${effectivePrefix}profile_image'],
      ),
      agreeToTerms:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}agree_to_terms'],
          )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      amount:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}amount'],
          )!,
    );
  }

  @override
  $PersonTblTable createAlias(String alias) {
    return $PersonTblTable(attachedDatabase, alias);
  }

  static TypeConverter<PhoneNumber, String> $converterphoneNumber =
      PhoneNumberConverter();
}

class PersonTblCompanion extends UpdateCompanion<Person> {
  final Value<int?> id;
  final Value<String> name;
  final Value<PhoneNumber> phoneNumber;
  final Value<String?> email;
  final Value<String?> password;
  final Value<Uint8List?> profileImage;
  final Value<double> amount;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<String?> about;
  final Value<bool> agreeToTerms;
  const PersonTblCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.email = const Value.absent(),
    this.password = const Value.absent(),
    this.profileImage = const Value.absent(),
    this.amount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.about = const Value.absent(),
    this.agreeToTerms = const Value.absent(),
  });
  PersonTblCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required PhoneNumber phoneNumber,
    this.email = const Value.absent(),
    this.password = const Value.absent(),
    this.profileImage = const Value.absent(),
    this.amount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.about = const Value.absent(),
    this.agreeToTerms = const Value.absent(),
  }) : name = Value(name),
       phoneNumber = Value(phoneNumber);
  static Insertable<Person> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? phoneNumber,
    Expression<String>? email,
    Expression<String>? password,
    Expression<Uint8List>? profileImage,
    Expression<double>? amount,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? about,
    Expression<bool>? agreeToTerms,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
      if (profileImage != null) 'profile_image': profileImage,
      if (amount != null) 'amount': amount,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (about != null) 'about': about,
      if (agreeToTerms != null) 'agree_to_terms': agreeToTerms,
    });
  }

  PersonTblCompanion copyWith({
    Value<int?>? id,
    Value<String>? name,
    Value<PhoneNumber>? phoneNumber,
    Value<String?>? email,
    Value<String?>? password,
    Value<Uint8List?>? profileImage,
    Value<double>? amount,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<String?>? about,
    Value<bool>? agreeToTerms,
  }) {
    return PersonTblCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      password: password ?? this.password,
      profileImage: profileImage ?? this.profileImage,
      amount: amount ?? this.amount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      about: about ?? this.about,
      agreeToTerms: agreeToTerms ?? this.agreeToTerms,
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
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(
        $PersonTblTable.$converterphoneNumber.toSql(phoneNumber.value),
      );
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (profileImage.present) {
      map['profile_image'] = Variable<Uint8List>(profileImage.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (about.present) {
      map['about'] = Variable<String>(about.value);
    }
    if (agreeToTerms.present) {
      map['agree_to_terms'] = Variable<bool>(agreeToTerms.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonTblCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('profileImage: $profileImage, ')
          ..write('amount: $amount, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('about: $about, ')
          ..write('agreeToTerms: $agreeToTerms')
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
      phoneNumber: Value(_object.phoneNumber),
      email: Value(_object.email),
      password: Value(_object.password),
      profileImage: Value(_object.profileImage),
      amount: Value(_object.amount),
      createdAt: Value(_object.createdAt),
      updatedAt: Value(_object.updatedAt),
      about: Value(_object.about),
      agreeToTerms: Value(_object.agreeToTerms),
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
      Value<int> id,
      required bool isLogined,
      Value<int?> personId,
    });
typedef $$SharedDataTableUpdateCompanionBuilder =
    SharedDataCompanion Function({
      Value<int> id,
      Value<bool> isLogined,
      Value<int?> personId,
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
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

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
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

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
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

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
                Value<int> id = const Value.absent(),
                Value<bool> isLogined = const Value.absent(),
                Value<int?> personId = const Value.absent(),
              }) => SharedDataCompanion(
                id: id,
                isLogined: isLogined,
                personId: personId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required bool isLogined,
                Value<int?> personId = const Value.absent(),
              }) => SharedDataCompanion.insert(
                id: id,
                isLogined: isLogined,
                personId: personId,
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
      required PhoneNumber phoneNumber,
      Value<String?> email,
      Value<String?> password,
      Value<Uint8List?> profileImage,
      Value<double> amount,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<String?> about,
      Value<bool> agreeToTerms,
    });
typedef $$PersonTblTableUpdateCompanionBuilder =
    PersonTblCompanion Function({
      Value<int?> id,
      Value<String> name,
      Value<PhoneNumber> phoneNumber,
      Value<String?> email,
      Value<String?> password,
      Value<Uint8List?> profileImage,
      Value<double> amount,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<String?> about,
      Value<bool> agreeToTerms,
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

  ColumnWithTypeConverterFilters<PhoneNumber, PhoneNumber, String>
  get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
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

  ColumnFilters<Uint8List> get profileImage => $composableBuilder(
    column: $table.profileImage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
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

  ColumnFilters<String> get about => $composableBuilder(
    column: $table.about,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get agreeToTerms => $composableBuilder(
    column: $table.agreeToTerms,
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

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
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

  ColumnOrderings<Uint8List> get profileImage => $composableBuilder(
    column: $table.profileImage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
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

  ColumnOrderings<String> get about => $composableBuilder(
    column: $table.about,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get agreeToTerms => $composableBuilder(
    column: $table.agreeToTerms,
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

  GeneratedColumnWithTypeConverter<PhoneNumber, String> get phoneNumber =>
      $composableBuilder(
        column: $table.phoneNumber,
        builder: (column) => column,
      );

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<Uint8List> get profileImage => $composableBuilder(
    column: $table.profileImage,
    builder: (column) => column,
  );

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get about =>
      $composableBuilder(column: $table.about, builder: (column) => column);

  GeneratedColumn<bool> get agreeToTerms => $composableBuilder(
    column: $table.agreeToTerms,
    builder: (column) => column,
  );
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
                Value<PhoneNumber> phoneNumber = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> password = const Value.absent(),
                Value<Uint8List?> profileImage = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<String?> about = const Value.absent(),
                Value<bool> agreeToTerms = const Value.absent(),
              }) => PersonTblCompanion(
                id: id,
                name: name,
                phoneNumber: phoneNumber,
                email: email,
                password: password,
                profileImage: profileImage,
                amount: amount,
                createdAt: createdAt,
                updatedAt: updatedAt,
                about: about,
                agreeToTerms: agreeToTerms,
              ),
          createCompanionCallback:
              ({
                Value<int?> id = const Value.absent(),
                required String name,
                required PhoneNumber phoneNumber,
                Value<String?> email = const Value.absent(),
                Value<String?> password = const Value.absent(),
                Value<Uint8List?> profileImage = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<String?> about = const Value.absent(),
                Value<bool> agreeToTerms = const Value.absent(),
              }) => PersonTblCompanion.insert(
                id: id,
                name: name,
                phoneNumber: phoneNumber,
                email: email,
                password: password,
                profileImage: profileImage,
                amount: amount,
                createdAt: createdAt,
                updatedAt: updatedAt,
                about: about,
                agreeToTerms: agreeToTerms,
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
