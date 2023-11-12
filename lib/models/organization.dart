import 'package:phone_book/models/drift_database.dart';
import 'package:uuid/uuid.dart';

class Organization {
  final String id;
  final String name;

  Organization({
    required this.id,
    required this.name,
  });

  Organization.empty()
      : this(
          id: const Uuid().v4(),
          name: '',
        );

  Organization.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] ?? '',
          name: json['name'] ?? '',
        );

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  Organization.fromDrift(OrganizationsTableData data)
      : this(
          id: data.id,
          name: data.name,
        );

  OrganizationsTableData toDrift() => OrganizationsTableData(
        id: id,
        name: name,
      );

  Organization copyWith({
    String? id,
    String? name,
  }) =>
      Organization(
        id: id ?? this.id,
        name: name ?? this.name,
      );
}
