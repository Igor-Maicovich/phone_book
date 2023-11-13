import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phone_book/core/models/models.dart';

class FirebaseRepository {
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

  Future<void> saveOrganization(Organization organization) async {
    return await organizationCollection.doc(organization.id).set(organization);
  }
}
