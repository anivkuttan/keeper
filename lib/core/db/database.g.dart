// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
mixin $PersonTblTableToColumns implements Insertable<Person> {
  int? get id;
  String get name;
  String get contactNumber;
  String? get email;
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
    map['contact_number'] = Variable<String>(contactNumber);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
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
  static const VerificationMeta _contactNumberMeta = const VerificationMeta(
    'contactNumber',
  );
  @override
  late final GeneratedColumn<String> contactNumber = GeneratedColumn<String>(
    'contact_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
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
    contactNumber,
    email,
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
    if (data.containsKey('contact_number')) {
      context.handle(
        _contactNumberMeta,
        contactNumber.isAcceptableOrUnknown(
          data['contact_number']!,
          _contactNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_contactNumberMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
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
      contactNumber:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}contact_number'],
          )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
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
}

class PersonTblCompanion extends UpdateCompanion<Person> {
  final Value<int?> id;
  final Value<String> name;
  final Value<String> contactNumber;
  final Value<String?> email;
  final Value<Uint8List?> imageUrl;
  final Value<double> owedAmount;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  const PersonTblCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.contactNumber = const Value.absent(),
    this.email = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.owedAmount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  PersonTblCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String contactNumber,
    this.email = const Value.absent(),
    this.imageUrl = const Value.absent(),
    required double owedAmount,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name),
       contactNumber = Value(contactNumber),
       owedAmount = Value(owedAmount);
  static Insertable<Person> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? contactNumber,
    Expression<String>? email,
    Expression<Uint8List>? imageUrl,
    Expression<double>? owedAmount,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (contactNumber != null) 'contact_number': contactNumber,
      if (email != null) 'email': email,
      if (imageUrl != null) 'image_url': imageUrl,
      if (owedAmount != null) 'owed_amount': owedAmount,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  PersonTblCompanion copyWith({
    Value<int?>? id,
    Value<String>? name,
    Value<String>? contactNumber,
    Value<String?>? email,
    Value<Uint8List?>? imageUrl,
    Value<double>? owedAmount,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return PersonTblCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      contactNumber: contactNumber ?? this.contactNumber,
      email: email ?? this.email,
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
    if (contactNumber.present) {
      map['contact_number'] = Variable<String>(contactNumber.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
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
          ..write('contactNumber: $contactNumber, ')
          ..write('email: $email, ')
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
      contactNumber: Value(_object.contactNumber),
      email: Value(_object.email),
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
  late final $PersonTblTable personTbl = $PersonTblTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [personTbl];
}

typedef $$PersonTblTableCreateCompanionBuilder =
    PersonTblCompanion Function({
      Value<int?> id,
      required String name,
      required String contactNumber,
      Value<String?> email,
      Value<Uint8List?> imageUrl,
      required double owedAmount,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$PersonTblTableUpdateCompanionBuilder =
    PersonTblCompanion Function({
      Value<int?> id,
      Value<String> name,
      Value<String> contactNumber,
      Value<String?> email,
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

  ColumnFilters<String> get contactNumber => $composableBuilder(
    column: $table.contactNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
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

  ColumnOrderings<String> get contactNumber => $composableBuilder(
    column: $table.contactNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
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

  GeneratedColumn<String> get contactNumber => $composableBuilder(
    column: $table.contactNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

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
                Value<String> contactNumber = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<Uint8List?> imageUrl = const Value.absent(),
                Value<double> owedAmount = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => PersonTblCompanion(
                id: id,
                name: name,
                contactNumber: contactNumber,
                email: email,
                imageUrl: imageUrl,
                owedAmount: owedAmount,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int?> id = const Value.absent(),
                required String name,
                required String contactNumber,
                Value<String?> email = const Value.absent(),
                Value<Uint8List?> imageUrl = const Value.absent(),
                required double owedAmount,
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => PersonTblCompanion.insert(
                id: id,
                name: name,
                contactNumber: contactNumber,
                email: email,
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
  $$PersonTblTableTableManager get personTbl =>
      $$PersonTblTableTableManager(_db, _db.personTbl);
}
