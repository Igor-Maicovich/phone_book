// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $OrganizationsTableTable extends OrganizationsTable
    with TableInfo<$OrganizationsTableTable, OrganizationsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrganizationsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'organizations_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<OrganizationsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrganizationsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrganizationsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $OrganizationsTableTable createAlias(String alias) {
    return $OrganizationsTableTable(attachedDatabase, alias);
  }
}

class OrganizationsTableData extends DataClass
    implements Insertable<OrganizationsTableData> {
  final String id;
  final String name;
  const OrganizationsTableData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  OrganizationsTableCompanion toCompanion(bool nullToAbsent) {
    return OrganizationsTableCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory OrganizationsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrganizationsTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  OrganizationsTableData copyWith({String? id, String? name}) =>
      OrganizationsTableData(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('OrganizationsTableData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrganizationsTableData &&
          other.id == this.id &&
          other.name == this.name);
}

class OrganizationsTableCompanion
    extends UpdateCompanion<OrganizationsTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> rowid;
  const OrganizationsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OrganizationsTableCompanion.insert({
    required String id,
    required String name,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name);
  static Insertable<OrganizationsTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OrganizationsTableCompanion copyWith(
      {Value<String>? id, Value<String>? name, Value<int>? rowid}) {
    return OrganizationsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrganizationsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EmployeesTableTable extends EmployeesTable
    with TableInfo<$EmployeesTableTable, EmployeesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmployeesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _organizationIdMeta =
      const VerificationMeta('organizationId');
  @override
  late final GeneratedColumn<String> organizationId = GeneratedColumn<String>(
      'organization_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES organizations_table (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _jobTitleMeta =
      const VerificationMeta('jobTitle');
  @override
  late final GeneratedColumn<String> jobTitle = GeneratedColumn<String>(
      'job_title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, organizationId, name, firstName, lastName, jobTitle, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'employees_table';
  @override
  VerificationContext validateIntegrity(Insertable<EmployeesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('organization_id')) {
      context.handle(
          _organizationIdMeta,
          organizationId.isAcceptableOrUnknown(
              data['organization_id']!, _organizationIdMeta));
    } else if (isInserting) {
      context.missing(_organizationIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('job_title')) {
      context.handle(_jobTitleMeta,
          jobTitle.isAcceptableOrUnknown(data['job_title']!, _jobTitleMeta));
    } else if (isInserting) {
      context.missing(_jobTitleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EmployeesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EmployeesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      organizationId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}organization_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      jobTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}job_title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
    );
  }

  @override
  $EmployeesTableTable createAlias(String alias) {
    return $EmployeesTableTable(attachedDatabase, alias);
  }
}

class EmployeesTableData extends DataClass
    implements Insertable<EmployeesTableData> {
  final String id;
  final String organizationId;
  final String name;
  final String firstName;
  final String lastName;
  final String jobTitle;
  final String description;
  const EmployeesTableData(
      {required this.id,
      required this.organizationId,
      required this.name,
      required this.firstName,
      required this.lastName,
      required this.jobTitle,
      required this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['organization_id'] = Variable<String>(organizationId);
    map['name'] = Variable<String>(name);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    map['job_title'] = Variable<String>(jobTitle);
    map['description'] = Variable<String>(description);
    return map;
  }

  EmployeesTableCompanion toCompanion(bool nullToAbsent) {
    return EmployeesTableCompanion(
      id: Value(id),
      organizationId: Value(organizationId),
      name: Value(name),
      firstName: Value(firstName),
      lastName: Value(lastName),
      jobTitle: Value(jobTitle),
      description: Value(description),
    );
  }

  factory EmployeesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EmployeesTableData(
      id: serializer.fromJson<String>(json['id']),
      organizationId: serializer.fromJson<String>(json['organizationId']),
      name: serializer.fromJson<String>(json['name']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      jobTitle: serializer.fromJson<String>(json['jobTitle']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'organizationId': serializer.toJson<String>(organizationId),
      'name': serializer.toJson<String>(name),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'jobTitle': serializer.toJson<String>(jobTitle),
      'description': serializer.toJson<String>(description),
    };
  }

  EmployeesTableData copyWith(
          {String? id,
          String? organizationId,
          String? name,
          String? firstName,
          String? lastName,
          String? jobTitle,
          String? description}) =>
      EmployeesTableData(
        id: id ?? this.id,
        organizationId: organizationId ?? this.organizationId,
        name: name ?? this.name,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        jobTitle: jobTitle ?? this.jobTitle,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('EmployeesTableData(')
          ..write('id: $id, ')
          ..write('organizationId: $organizationId, ')
          ..write('name: $name, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('jobTitle: $jobTitle, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, organizationId, name, firstName, lastName, jobTitle, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EmployeesTableData &&
          other.id == this.id &&
          other.organizationId == this.organizationId &&
          other.name == this.name &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.jobTitle == this.jobTitle &&
          other.description == this.description);
}

class EmployeesTableCompanion extends UpdateCompanion<EmployeesTableData> {
  final Value<String> id;
  final Value<String> organizationId;
  final Value<String> name;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String> jobTitle;
  final Value<String> description;
  final Value<int> rowid;
  const EmployeesTableCompanion({
    this.id = const Value.absent(),
    this.organizationId = const Value.absent(),
    this.name = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.jobTitle = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EmployeesTableCompanion.insert({
    required String id,
    required String organizationId,
    required String name,
    required String firstName,
    required String lastName,
    required String jobTitle,
    required String description,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        organizationId = Value(organizationId),
        name = Value(name),
        firstName = Value(firstName),
        lastName = Value(lastName),
        jobTitle = Value(jobTitle),
        description = Value(description);
  static Insertable<EmployeesTableData> custom({
    Expression<String>? id,
    Expression<String>? organizationId,
    Expression<String>? name,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? jobTitle,
    Expression<String>? description,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (organizationId != null) 'organization_id': organizationId,
      if (name != null) 'name': name,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (jobTitle != null) 'job_title': jobTitle,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EmployeesTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? organizationId,
      Value<String>? name,
      Value<String>? firstName,
      Value<String>? lastName,
      Value<String>? jobTitle,
      Value<String>? description,
      Value<int>? rowid}) {
    return EmployeesTableCompanion(
      id: id ?? this.id,
      organizationId: organizationId ?? this.organizationId,
      name: name ?? this.name,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      jobTitle: jobTitle ?? this.jobTitle,
      description: description ?? this.description,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (organizationId.present) {
      map['organization_id'] = Variable<String>(organizationId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (jobTitle.present) {
      map['job_title'] = Variable<String>(jobTitle.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmployeesTableCompanion(')
          ..write('id: $id, ')
          ..write('organizationId: $organizationId, ')
          ..write('name: $name, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('jobTitle: $jobTitle, ')
          ..write('description: $description, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PhonesTableTable extends PhonesTable
    with TableInfo<$PhonesTableTable, PhonesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PhonesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _employeeIdMeta =
      const VerificationMeta('employeeId');
  @override
  late final GeneratedColumn<String> employeeId = GeneratedColumn<String>(
      'employee_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES employees_table (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<String> number = GeneratedColumn<String>(
      'number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, employeeId, number, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'phones_table';
  @override
  VerificationContext validateIntegrity(Insertable<PhonesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('employee_id')) {
      context.handle(
          _employeeIdMeta,
          employeeId.isAcceptableOrUnknown(
              data['employee_id']!, _employeeIdMeta));
    } else if (isInserting) {
      context.missing(_employeeIdMeta);
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PhonesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PhonesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      employeeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}employee_id'])!,
      number: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}number'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
    );
  }

  @override
  $PhonesTableTable createAlias(String alias) {
    return $PhonesTableTable(attachedDatabase, alias);
  }
}

class PhonesTableData extends DataClass implements Insertable<PhonesTableData> {
  final String id;
  final String employeeId;
  final String number;
  final String description;
  const PhonesTableData(
      {required this.id,
      required this.employeeId,
      required this.number,
      required this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['employee_id'] = Variable<String>(employeeId);
    map['number'] = Variable<String>(number);
    map['description'] = Variable<String>(description);
    return map;
  }

  PhonesTableCompanion toCompanion(bool nullToAbsent) {
    return PhonesTableCompanion(
      id: Value(id),
      employeeId: Value(employeeId),
      number: Value(number),
      description: Value(description),
    );
  }

  factory PhonesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PhonesTableData(
      id: serializer.fromJson<String>(json['id']),
      employeeId: serializer.fromJson<String>(json['employeeId']),
      number: serializer.fromJson<String>(json['number']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'employeeId': serializer.toJson<String>(employeeId),
      'number': serializer.toJson<String>(number),
      'description': serializer.toJson<String>(description),
    };
  }

  PhonesTableData copyWith(
          {String? id,
          String? employeeId,
          String? number,
          String? description}) =>
      PhonesTableData(
        id: id ?? this.id,
        employeeId: employeeId ?? this.employeeId,
        number: number ?? this.number,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('PhonesTableData(')
          ..write('id: $id, ')
          ..write('employeeId: $employeeId, ')
          ..write('number: $number, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, employeeId, number, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PhonesTableData &&
          other.id == this.id &&
          other.employeeId == this.employeeId &&
          other.number == this.number &&
          other.description == this.description);
}

class PhonesTableCompanion extends UpdateCompanion<PhonesTableData> {
  final Value<String> id;
  final Value<String> employeeId;
  final Value<String> number;
  final Value<String> description;
  final Value<int> rowid;
  const PhonesTableCompanion({
    this.id = const Value.absent(),
    this.employeeId = const Value.absent(),
    this.number = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PhonesTableCompanion.insert({
    required String id,
    required String employeeId,
    required String number,
    required String description,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        employeeId = Value(employeeId),
        number = Value(number),
        description = Value(description);
  static Insertable<PhonesTableData> custom({
    Expression<String>? id,
    Expression<String>? employeeId,
    Expression<String>? number,
    Expression<String>? description,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (employeeId != null) 'employee_id': employeeId,
      if (number != null) 'number': number,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PhonesTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? employeeId,
      Value<String>? number,
      Value<String>? description,
      Value<int>? rowid}) {
    return PhonesTableCompanion(
      id: id ?? this.id,
      employeeId: employeeId ?? this.employeeId,
      number: number ?? this.number,
      description: description ?? this.description,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (employeeId.present) {
      map['employee_id'] = Variable<String>(employeeId.value);
    }
    if (number.present) {
      map['number'] = Variable<String>(number.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PhonesTableCompanion(')
          ..write('id: $id, ')
          ..write('employeeId: $employeeId, ')
          ..write('number: $number, ')
          ..write('description: $description, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $OrganizationsTableTable organizationsTable =
      $OrganizationsTableTable(this);
  late final $EmployeesTableTable employeesTable = $EmployeesTableTable(this);
  late final $PhonesTableTable phonesTable = $PhonesTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [organizationsTable, employeesTable, phonesTable];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('organizations_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('employees_table', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('organizations_table',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('employees_table', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('employees_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('phones_table', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('employees_table',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('phones_table', kind: UpdateKind.update),
            ],
          ),
        ],
      );
}
