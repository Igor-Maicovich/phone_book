import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:phone_book/core/models/models.dart';
import 'package:phone_book/core/services/drift_service.dart';
import 'package:uuid/uuid.dart';

part 'edit_employee_store.g.dart';

class EmployeeEditStore extends _EmployeeEditStore with _$EmployeeEditStore {
  static EmployeeEditStore get shared => GetIt.I.get<EmployeeEditStore>();

  Future<EmployeeEditStore> init(Employee? emp) async {
    await getPhones(emp?.id);
    await getOrganizations();
    selectedOrg = organizations.firstWhere(
      (org) => org.id == emp?.organizationId,
      orElse: () => Organization.empty(),
    );
    id = emp?.id ?? const Uuid().v4();
    name = emp?.name ?? '';
    firstName = emp?.firstName ?? '';
    lastName = emp?.lastName ?? '';
    jobTitle = emp?.jobTitle ?? '';
    description = emp?.description ?? '';
    return this;
  }
}

abstract class _EmployeeEditStore with Store {
  @observable
  ObservableList<Organization> organizations = ObservableList<Organization>();

  @observable
  ObservableList<Phone> phones = ObservableList<Phone>();

  @observable
  String id = '';

  @observable
  String name = '';

  @observable
  String firstName = '';

  @observable
  String lastName = '';

  @observable
  String jobTitle = '';

  @observable
  String description = '';

  @observable
  String error = '';

  @observable
  Organization selectedOrg = Organization.empty();

  @action
  Future<void> getPhones(String? id) async {
    phones = ObservableList.of(await DriftService().selectPhones(id));
  }

  @action
  Future<void> getOrganizations() async {
    organizations = ObservableList.of(
      await DriftService().selectOrganizations(),
    );
  }

  @action
  void setOrganization(String? value) {
    selectedOrg = organizations.firstWhere(
      (org) => org.name == name.toLowerCase(),
      orElse: () => Organization(id: const Uuid().v4(), name: value ?? ''),
    );
  }

  @action
  void setName(String? value) {
    if (value != null) name = value;
  }

  @action
  void setFirstName(String? value) {
    if (value != null) firstName = value;
  }

  @action
  void setLastName(String? value) {
    if (value != null) lastName = value;
  }

  @action
  void setJobTitle(String? value) {
    if (value != null) jobTitle = value;
  }

  @action
  void setDescription(String? value) {
    if (value != null) description = value;
  }

  @action
  void setPhone(Phone phone) {
    int index = phones.indexWhere((element) => element.id == phone.id);
    if (index >= 0) {
      phones.removeAt(index);
    }
    phones.add(phone);
  }

  @action
  Future<void> saveEmployee() async {
    if (_employeeValid()) {
      await DriftService().insertOrganization(selectedOrg);
      await DriftService().insertEmployee(
        Employee(
          id: id,
          organizationId: selectedOrg.id,
          name: name,
          firstName: firstName,
          lastName: lastName,
          jobTitle: jobTitle,
          description: description,
        ),
      );
      for (var phone in phones) {
        await DriftService().insertPhone(phone.copyWith(employeeId: id));
      }
    }
  }

  bool _employeeValid() {
    if (!selectedOrg.isValid()) {
      error = 'Укажите организацию';
      return false;
    }
    if (name.isEmpty) {
      error = 'Укажите имя';
      return false;
    }
    if (phones.isEmpty) {
      error = 'Добавьте телефон';
      return false;
    }
    error = '';
    return true;
  }
}
