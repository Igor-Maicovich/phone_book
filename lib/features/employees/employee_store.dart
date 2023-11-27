import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:phone_book/core/models/models.dart';
import 'package:phone_book/core/repository/drift_repository.dart';

part 'employee_store.g.dart';

class EmployeeStore extends _EmployeeStore with _$EmployeeStore {
  static EmployeeStore get shared => GetIt.I.get<EmployeeStore>();

  Future<EmployeeStore> init() async {
    return this;
  }
}

abstract class _EmployeeStore with Store {
  @observable
  ObservableList<Employee> employees = ObservableList<Employee>();

  @action
  Future<void> getEmployees(String id) async {
    employees =
        ObservableList.of(await DriftRepository.shared.getEmployees(id));
  }

  @action
  Future<void> deleteEmployee(Employee employee) async {
    DriftRepository.shared.deleteEmployee(employee);
  }
}
