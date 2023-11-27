import 'package:drift/drift.dart';
import 'package:get_it/get_it.dart';
import 'package:phone_book/core/models/models.dart';

class DriftRepository {
  AppDatabase db = AppDatabase.shared;

  static DriftRepository get shared => GetIt.I.get<DriftRepository>();

  Future<List<Organization>> getOrganizations() async {
    List<OrganizationsTableData> responseDb =
        await db.select(db.organizationsTable).get();
    return responseDb.map((org) => Organization.fromDrift(org)).toList();
  }

  Future<List<Employee>> getEmployees(String? id) async {
    if (id == null) return [];
    return db.employeesById(id);
  }

  Future<List<Phone>> getPhones(String? id) async {
    if (id == null) return [];
    return db.phonesById(id);
  }

  Future<void> saveEmployee({
    required Organization organization,
    required Employee employee,
    required List<Phone> phones,
    required List<Phone> deletedPhones,
  }) async {
    return await db.transaction(() async {
      await db.updateOrganization(organization.toDrift());
      await db.updateEmployee(employee.toDrift());
      for (var phone in phones) {
        await db.updatePhone(phone.toDrift());
      }
      for (var delPhone in deletedPhones) {
        await db.delete(db.phonesTable).delete(delPhone.toDrift());
      }
    });
  }

  Future<int> deleteOrganization(Organization organization) async {
    return db.delete(db.organizationsTable).delete(organization.toDrift());
  }

  Future<int> deleteEmployee(Employee employee) async {
    return db.delete(db.employeesTable).delete(employee.toDrift());
  }

  Future<int> deletePhone(Phone phone) async {
    return db.delete(db.phonesTable).delete(phone.toDrift());
  }

  Future<void> pullDataBase({
    required List<Organization> orgs,
    required List<Employee> emps,
    required List<Phone> phones,
  }) async {
    return await db.transaction(() async {
      await db.organizationsTable.deleteAll();
      for (var org in orgs) {
        await db.into(db.organizationsTable).insert(org.toDrift());
      }
      await db.employeesTable.deleteAll();
      for (var emp in emps) {
        await db.into(db.employeesTable).insert(emp.toDrift());
      }
      await db.phonesTable.deleteAll();
      for (var phone in phones) {
        await db.into(db.phonesTable).insert(phone.toDrift());
      }
    });
  }
}
