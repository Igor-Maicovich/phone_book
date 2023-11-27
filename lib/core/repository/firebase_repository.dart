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

  Future<void> saveEmployee({
    required Organization organization,
    required Employee employee,
    required List<Phone> phones,
    required List<Phone> deletedPhones,
  }) async {
    final batch = FirebaseFirestore.instance.batch();
    var refOrg = organizationCollection.doc(organization.id);
    batch.set(refOrg, organization);
    var refEmp = employeeCollection.doc(employee.id);
    batch.set(refEmp, employee);
    for (var phone in phones) {
      var ref = phoneCollection.doc(phone.id);
      batch.set(ref, phone);
    }
    for (var delPhone in deletedPhones) {
      batch.delete(phoneCollection.doc(delPhone.id));
    }
    await batch.commit();
  }

  Future<void> deleteEmployee({
    required Employee employee,
    required List<Phone> phones,
  }) async {
    final batch = FirebaseFirestore.instance.batch();
    batch.delete(employeeCollection.doc(employee.id));
    for (var phone in phones) {
      batch.delete(phoneCollection.doc(phone.id));
    }
    await batch.commit();
  }
}
