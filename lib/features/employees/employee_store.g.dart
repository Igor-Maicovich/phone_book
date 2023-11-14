// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EmployeeStore on _EmployeeStore, Store {
  late final _$employeesAtom =
      Atom(name: '_EmployeeStore.employees', context: context);

  @override
  ObservableList<Employee> get employees {
    _$employeesAtom.reportRead();
    return super.employees;
  }

  @override
  set employees(ObservableList<Employee> value) {
    _$employeesAtom.reportWrite(value, super.employees, () {
      super.employees = value;
    });
  }

  late final _$getEmployeesAsyncAction =
      AsyncAction('_EmployeeStore.getEmployees', context: context);

  @override
  Future<void> getEmployees(String id) {
    return _$getEmployeesAsyncAction.run(() => super.getEmployees(id));
  }

  @override
  String toString() {
    return '''
employees: ${employees}
    ''';
  }
}
