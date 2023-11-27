import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:phone_book/core/models/models.dart';

part 'drift_database.g.dart';

class OrganizationsTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class EmployeesTable extends Table {
  TextColumn get id => text()();
  TextColumn get organizationId => text().references(
        OrganizationsTable,
        #id,
        onDelete: KeyAction.cascade,
        onUpdate: KeyAction.cascade,
      )();
  TextColumn get name => text()();
  TextColumn get firstName => text()();
  TextColumn get lastName => text()();
  TextColumn get jobTitle => text()();
  TextColumn get description => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class PhonesTable extends Table {
  TextColumn get id => text()();
  TextColumn get employeeId => text().references(
        EmployeesTable,
        #id,
        onDelete: KeyAction.cascade,
        onUpdate: KeyAction.cascade,
      )();
  TextColumn get number => text()();
  TextColumn get description => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [OrganizationsTable, EmployeesTable, PhonesTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  static AppDatabase get shared => GetIt.I.get<AppDatabase>();

  @override
  int get schemaVersion => 1;

  Future<int> updateOrganization(OrganizationsTableData organization) {
    return into(organizationsTable).insertOnConflictUpdate(organization);
  }

  Future<int> updateEmployee(EmployeesTableData employee) {
    return into(employeesTable).insertOnConflictUpdate(employee);
  }

  Future<int> updatePhone(PhonesTableData phone) {
    return into(phonesTable).insertOnConflictUpdate(phone);
  }

  Future<List<Employee>> employeesById(String id) async {
    List<EmployeesTableData> list = await (select(employeesTable)
          ..where((emp) => emp.organizationId.equals(id)))
        .get();
    return list.map((e) => Employee.fromDrift(e)).toList();
  }

  Future<List<Phone>> phonesById(String id) async {
    List<PhonesTableData> list = await (select(phonesTable)
          ..where((phone) => phone.employeeId.equals(id)))
        .get();
    return list.map((p) => Phone.fromDrift(p)).toList();
  }

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON;');
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
