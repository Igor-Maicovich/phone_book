import 'package:phone_book/core/models/models.dart';

class Employee {
  final String id;
  final String organizationId;
  final String name;
  final String firstName;
  final String lastName;
  final String jobTitle;
  final String description;

  Employee({
    required this.id,
    required this.organizationId,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.jobTitle,
    required this.description,
  });

  String get fullName => "$firstName $name $lastName";

  Employee.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] ?? '',
          organizationId: json['organizationId'] ?? '',
          name: json['name'] ?? '',
          firstName: json['firstName'] ?? '',
          lastName: json['lastName'] ?? '',
          jobTitle: json['jobTitle'] ?? '',
          description: json['description'] ?? '',
        );

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'organizationId': organizationId,
      'name': name,
      'firstName': firstName,
      'lastName': lastName,
      'jobTitle': jobTitle,
      'description': description,
    };
  }

  Employee.fromDrift(EmployeesTableData data)
      : this(
          id: data.id,
          organizationId: data.organizationId,
          name: data.name,
          firstName: data.firstName,
          lastName: data.lastName,
          jobTitle: data.jobTitle,
          description: data.description,
        );

  EmployeesTableData toDrift() => EmployeesTableData(
        id: id,
        organizationId: organizationId,
        name: name,
        firstName: firstName,
        lastName: lastName,
        jobTitle: jobTitle,
        description: description,
      );
}
