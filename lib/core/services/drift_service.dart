import 'package:phone_book/core/models/models.dart';

class DriftService {
  AppDatabase db = AppDatabase();

  Future<List<Organization>> selectOrganizations() async {
    return [
      Organization(id: 'org1', name: 'Организация 1'),
      Organization(id: 'org2', name: 'Организация 2'),
    ];
    // List<OrganizationsTableData> responseDb =
    //     await db.select(db.organizationsTable).get();
    // return responseDb.map((org) => Organization.fromDrift(org)).toList();
  }

  Future<List<Employee>> selectEmploeeys(String id) async {
    var list = [
      Employee(
          id: 'emp10',
          organizationId: 'org1',
          name: '10',
          firstName: '10',
          lastName: '10',
          jobTitle: '10',
          description: '10'),
      Employee(
          id: 'emp11',
          organizationId: 'org1',
          name: '11',
          firstName: '11',
          lastName: '11',
          jobTitle: '11',
          description: '11'),
      Employee(
          id: 'emp20',
          organizationId: 'org2',
          name: '20',
          firstName: '20',
          lastName: '20',
          jobTitle: '20',
          description: '20'),
      Employee(
          id: 'emp21',
          organizationId: 'org2',
          name: '21',
          firstName: '21',
          lastName: '21',
          jobTitle: '21',
          description: '21'),
    ];
    return list.where((emp) => id == emp.organizationId).toList();
    // List<EmployeesTableData> responseDb =
    //     await db.select(db.employeesTable).get();
    // return responseDb.map((emp) => Employee.fromDrift(emp)).toList();
  }

  Future<List<Phone>> selectPhones(String? id) async {
    if (id == null) return [];
    var list = const [
      Phone(
          id: 'p100',
          employeeId: 'emp10',
          number: '11111',
          description: 'mobile'),
      Phone(
          id: 'p101',
          employeeId: 'emp10',
          number: '11111',
          description: 'work'),
      Phone(
          id: 'p110',
          employeeId: 'emp11',
          number: '11111',
          description: 'mobile'),
      Phone(
          id: 'p111',
          employeeId: 'emp11',
          number: '11111',
          description: 'work'),
      Phone(
          id: 'p200',
          employeeId: 'emp20',
          number: '11111',
          description: 'mobile'),
      Phone(
          id: 'pxs211',
          employeeId: 'emp21',
          number: '11111',
          description: 'work'),
    ];
    return list.where((p) => id == p.employeeId).toList();
    // List<PhonesTableData> responseDb = await db.select(db.phonesTable).get();
    // return responseDb.map((phone) => Phone.fromDrift(phone)).toList();
  }

  Future<void> insertOrganization(Organization organization) {
    return db.into(db.organizationsTable).insert(organization.toDrift());
  }

  Future<void> insertEmployee(Employee employee) {
    return db.into(db.employeesTable).insert(employee.toDrift());
  }

  Future<void> insertPhone(Phone phone) {
    return db.into(db.phonesTable).insert(phone.toDrift());
  }

  Future<void> updateOrganization(Organization organization) {
    return db.update(db.organizationsTable).replace(organization.toDrift());
  }

  Future<void> updateEmployee(Employee employee) {
    return db.update(db.employeesTable).replace(employee.toDrift());
  }

  Future<void> updatePhone(Phone phone) {
    return db.update(db.phonesTable).replace(phone.toDrift());
  }

  Future<void> deleteOrganization(Organization organization) {
    return db.delete(db.organizationsTable).delete(organization.toDrift());
  }

  Future<void> deleteEmployee(Employee employee) {
    return db.delete(db.employeesTable).delete(employee.toDrift());
  }

  Future<void> deletePhone(Phone phone) {
    return db.delete(db.phonesTable).delete(phone.toDrift());
  }
}
