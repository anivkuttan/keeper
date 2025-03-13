// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $PersonTblTable extends PersonTbl
    with TableInfo<$PersonTblTable, PersonTblData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PersonTblTable(this.attachedDatabase, [this._alias]);
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
  @override
  List<GeneratedColumn> get $columns => [
    name,
    contactNumber,
    email,
    imageUrl,
    owedAmount,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'person_tbl';
  @override
  VerificationContext validateIntegrity(
    Insertable<PersonTblData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  PersonTblData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PersonTblData(
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
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.blob,
        data['${effectivePrefix}image_url'],
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

class PersonTblData extends DataClass implements Insertable<PersonTblData> {
  final String name;
  final String contactNumber;
  final String? email;
  final Uint8List? imageUrl;
  final double owedAmount;
  const PersonTblData({
    required this.name,
    required this.contactNumber,
    this.email,
    this.imageUrl,
    required this.owedAmount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['contact_number'] = Variable<String>(contactNumber);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<Uint8List>(imageUrl);
    }
    map['owed_amount'] = Variable<double>(owedAmount);
    return map;
  }

  PersonTblCompanion toCompanion(bool nullToAbsent) {
    return PersonTblCompanion(
      name: Value(name),
      contactNumber: Value(contactNumber),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      imageUrl:
          imageUrl == null && nullToAbsent
              ? const Value.absent()
              : Value(imageUrl),
      owedAmount: Value(owedAmount),
    );
  }

  factory PersonTblData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PersonTblData(
      name: serializer.fromJson<String>(json['name']),
      contactNumber: serializer.fromJson<String>(json['contactNumber']),
      email: serializer.fromJson<String?>(json['email']),
      imageUrl: serializer.fromJson<Uint8List?>(json['imageUrl']),
      owedAmount: serializer.fromJson<double>(json['owedAmount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'contactNumber': serializer.toJson<String>(contactNumber),
      'email': serializer.toJson<String?>(email),
      'imageUrl': serializer.toJson<Uint8List?>(imageUrl),
      'owedAmount': serializer.toJson<double>(owedAmount),
    };
  }

  PersonTblData copyWith({
    String? name,
    String? contactNumber,
    Value<String?> email = const Value.absent(),
    Value<Uint8List?> imageUrl = const Value.absent(),
    double? owedAmount,
  }) => PersonTblData(
    name: name ?? this.name,
    contactNumber: contactNumber ?? this.contactNumber,
    email: email.present ? email.value : this.email,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
    owedAmount: owedAmount ?? this.owedAmount,
  );
  PersonTblData copyWithCompanion(PersonTblCompanion data) {
    return PersonTblData(
      name: data.name.present ? data.name.value : this.name,
      contactNumber:
          data.contactNumber.present
              ? data.contactNumber.value
              : this.contactNumber,
      email: data.email.present ? data.email.value : this.email,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      owedAmount:
          data.owedAmount.present ? data.owedAmount.value : this.owedAmount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PersonTblData(')
          ..write('name: $name, ')
          ..write('contactNumber: $contactNumber, ')
          ..write('email: $email, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('owedAmount: $owedAmount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    name,
    contactNumber,
    email,
    $driftBlobEquality.hash(imageUrl),
    owedAmount,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PersonTblData &&
          other.name == this.name &&
          other.contactNumber == this.contactNumber &&
          other.email == this.email &&
          $driftBlobEquality.equals(other.imageUrl, this.imageUrl) &&
          other.owedAmount == this.owedAmount);
}

class PersonTblCompanion extends UpdateCompanion<PersonTblData> {
  final Value<String> name;
  final Value<String> contactNumber;
  final Value<String?> email;
  final Value<Uint8List?> imageUrl;
  final Value<double> owedAmount;
  final Value<int> rowid;
  const PersonTblCompanion({
    this.name = const Value.absent(),
    this.contactNumber = const Value.absent(),
    this.email = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.owedAmount = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PersonTblCompanion.insert({
    required String name,
    required String contactNumber,
    this.email = const Value.absent(),
    this.imageUrl = const Value.absent(),
    required double owedAmount,
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       contactNumber = Value(contactNumber),
       owedAmount = Value(owedAmount);
  static Insertable<PersonTblData> custom({
    Expression<String>? name,
    Expression<String>? contactNumber,
    Expression<String>? email,
    Expression<Uint8List>? imageUrl,
    Expression<double>? owedAmount,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (contactNumber != null) 'contact_number': contactNumber,
      if (email != null) 'email': email,
      if (imageUrl != null) 'image_url': imageUrl,
      if (owedAmount != null) 'owed_amount': owedAmount,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PersonTblCompanion copyWith({
    Value<String>? name,
    Value<String>? contactNumber,
    Value<String?>? email,
    Value<Uint8List?>? imageUrl,
    Value<double>? owedAmount,
    Value<int>? rowid,
  }) {
    return PersonTblCompanion(
      name: name ?? this.name,
      contactNumber: contactNumber ?? this.contactNumber,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      owedAmount: owedAmount ?? this.owedAmount,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonTblCompanion(')
          ..write('name: $name, ')
          ..write('contactNumber: $contactNumber, ')
          ..write('email: $email, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('owedAmount: $owedAmount, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
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
      required String name,
      required String contactNumber,
      Value<String?> email,
      Value<Uint8List?> imageUrl,
      required double owedAmount,
      Value<int> rowid,
    });
typedef $$PersonTblTableUpdateCompanionBuilder =
    PersonTblCompanion Function({
      Value<String> name,
      Value<String> contactNumber,
      Value<String?> email,
      Value<Uint8List?> imageUrl,
      Value<double> owedAmount,
      Value<int> rowid,
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
}

class $$PersonTblTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PersonTblTable,
          PersonTblData,
          $$PersonTblTableFilterComposer,
          $$PersonTblTableOrderingComposer,
          $$PersonTblTableAnnotationComposer,
          $$PersonTblTableCreateCompanionBuilder,
          $$PersonTblTableUpdateCompanionBuilder,
          (
            PersonTblData,
            BaseReferences<_$AppDatabase, $PersonTblTable, PersonTblData>,
          ),
          PersonTblData,
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
                Value<String> name = const Value.absent(),
                Value<String> contactNumber = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<Uint8List?> imageUrl = const Value.absent(),
                Value<double> owedAmount = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PersonTblCompanion(
                name: name,
                contactNumber: contactNumber,
                email: email,
                imageUrl: imageUrl,
                owedAmount: owedAmount,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String name,
                required String contactNumber,
                Value<String?> email = const Value.absent(),
                Value<Uint8List?> imageUrl = const Value.absent(),
                required double owedAmount,
                Value<int> rowid = const Value.absent(),
              }) => PersonTblCompanion.insert(
                name: name,
                contactNumber: contactNumber,
                email: email,
                imageUrl: imageUrl,
                owedAmount: owedAmount,
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

typedef $$PersonTblTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PersonTblTable,
      PersonTblData,
      $$PersonTblTableFilterComposer,
      $$PersonTblTableOrderingComposer,
      $$PersonTblTableAnnotationComposer,
      $$PersonTblTableCreateCompanionBuilder,
      $$PersonTblTableUpdateCompanionBuilder,
      (
        PersonTblData,
        BaseReferences<_$AppDatabase, $PersonTblTable, PersonTblData>,
      ),
      PersonTblData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PersonTblTableTableManager get personTbl =>
      $$PersonTblTableTableManager(_db, _db.personTbl);
}
