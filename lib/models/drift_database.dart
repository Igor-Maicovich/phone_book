import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

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

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
