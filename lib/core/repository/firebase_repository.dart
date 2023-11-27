import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:phone_book/core/models/models.dart';

class FirebaseRepository {
  static FirebaseRepository get shared => GetIt.I.get<FirebaseRepository>();
  CollectionReference<Organization> organizationCollection = FirebaseFirestore
      .instance
      .collection('Organizations')
      .withConverter<Organization>(
        fromFirestore: (snapshot, _) => Organization.fromJson(snapshot.data()!),
        toFirestore: (org, _) => org.toJson(),
      );
  CollectionReference<Employee> employeeCollection = FirebaseFirestore.instance
      .collection('Employees')
      .withConverter<Employee>(
        fromFirestore: (snapshot, _) => Employee.fromJson(snapshot.data()!),
        toFirestore: (emp, _) => emp.toJson(),
      );
  CollectionReference<Phone> phoneCollection =
      FirebaseFirestore.instance.collection('Phones').withConverter<Phone>(
            fromFirestore: (snapshot, _) => Phone.fromJson(snapshot.data()!),
            toFirestore: (phone, _) => phone.toJson(),
          );

  Future<List<Organization>> getAllOrganizations() async {
    var snapshot = await organizationCollection.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<List<Employee>> getAllEmployees() async {
    var snapshot = await employeeCollection.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<List<Phone>> getAllPhones() async {
    var snapshot = await phoneCollection.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<void> pushDataBase({
    required List<Organization> orgs,
    required List<Employee> emps,
    required List<Phone> phones,
  }) async {
    final batch = FirebaseFirestore.instance.batch();
    //Удаление таблицы организаций
    var orgSnapshot = await organizationCollection.get();
    for (var org in orgSnapshot.docs) {
      var ref = organizationCollection.doc(org.id);
      batch.delete(ref);
    }
    //Запись таблицы организаций
    for (var org in orgs) {
      var ref = organizationCollection.doc(org.id);
      batch.set(ref, org);
    }
    //Удаление таблицы сотрудников
    var empSnapshot = await employeeCollection.get();
    for (var emp in empSnapshot.docs) {
      var ref = employeeCollection.doc(emp.id);
      batch.delete(ref);
    }
    //Запись таблицы сотрудников
    for (var emp in emps) {
      var ref = employeeCollection.doc(emp.id);
      batch.set(ref, emp);
    }
    //Удаление таблицы телефонов
    var phoneSnapshot = await phoneCollection.get();
    for (var phone in phoneSnapshot.docs) {
      var ref = phoneCollection.doc(phone.id);
      batch.delete(ref);
    }
    //Запись таблицы телефонов
    for (var phone in phones) {
      var ref = phoneCollection.doc(phone.id);
      batch.set(ref, phone);
    }
    //Коммит изменений
    await batch.commit();
  }
}
