import 'package:phone_book/models/models.dart';

class Phone {
  final String id;
  final String employeeId;
  final String number;
  final String description;

  const Phone({
    required this.id,
    required this.employeeId,
    required this.number,
    required this.description,
  });

  Phone.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id']! as String,
          employeeId: json['employeeId'] ?? '',
          number: json['number'] ?? '',
          description: json['description'] ?? '',
        );

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'employeeId': employeeId,
      'number': number,
      'description': description,
    };
  }

  Phone.fromDrift(PhonesTableData data)
      : this(
          id: data.id,
          employeeId: data.employeeId,
          number: data.number,
          description: data.description,
        );

  PhonesTableData toDrift() => PhonesTableData(
        id: id,
        employeeId: employeeId,
        number: number,
        description: description,
      );
}
