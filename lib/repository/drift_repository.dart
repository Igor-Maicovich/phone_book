import 'package:phone_book/models/models.dart';

class DriftRepository {
  AppDatabase db = AppDatabase();

  Future<void> addEmployee({
    required Organization organization,
    required Employee employee,
    required List<Phone> phones,
  }) async {
    return await db.transaction(() async {
      await db.update(db.organizationsTable).replace(organization.toDrift());
      await db.update(db.employeesTable).replace(employee.toDrift());
      for (var phone in phones) {
        await db.update(db.phonesTable).replace(phone.toDrift());
      }
    });
  }
}
