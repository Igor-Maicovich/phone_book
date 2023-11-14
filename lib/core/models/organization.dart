import 'package:phone_book/core/models/drift_database.dart';

class Organization {
  final String id;
  final String name;

  Organization({
    required this.id,
    required this.name,
  });

  Organization.empty()
      : this(
          id: '',
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
        name: name.toLowerCase(),
      );

  Organization copyWith({
    String? id,
    String? name,
  }) =>
      Organization(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  bool isValid() => id.isNotEmpty && name.isNotEmpty;

  @override
  String toString() => '{id:$id, name:$name}';
}
