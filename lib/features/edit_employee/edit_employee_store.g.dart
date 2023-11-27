// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_employee_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EmployeeEditStore on _EmployeeEditStore, Store {
  late final _$organizationsAtom =
      Atom(name: '_EmployeeEditStore.organizations', context: context);

  @override
  ObservableList<Organization> get organizations {
    _$organizationsAtom.reportRead();
    return super.organizations;
  }

  @override
  set organizations(ObservableList<Organization> value) {
    _$organizationsAtom.reportWrite(value, super.organizations, () {
      super.organizations = value;
    });
  }

  late final _$phonesAtom =
      Atom(name: '_EmployeeEditStore.phones', context: context);

  @override
  ObservableList<Phone> get phones {
    _$phonesAtom.reportRead();
    return super.phones;
  }

  @override
  set phones(ObservableList<Phone> value) {
    _$phonesAtom.reportWrite(value, super.phones, () {
      super.phones = value;
    });
  }

  late final _$deletedPhonesAtom =
      Atom(name: '_EmployeeEditStore.deletedPhones', context: context);

  @override
  ObservableList<Phone> get deletedPhones {
    _$deletedPhonesAtom.reportRead();
    return super.deletedPhones;
  }

  @override
  set deletedPhones(ObservableList<Phone> value) {
    _$deletedPhonesAtom.reportWrite(value, super.deletedPhones, () {
      super.deletedPhones = value;
    });
  }

  late final _$idAtom = Atom(name: '_EmployeeEditStore.id', context: context);

  @override
  String get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$nameAtom =
      Atom(name: '_EmployeeEditStore.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$firstNameAtom =
      Atom(name: '_EmployeeEditStore.firstName', context: context);

  @override
  String get firstName {
    _$firstNameAtom.reportRead();
    return super.firstName;
  }

  @override
  set firstName(String value) {
    _$firstNameAtom.reportWrite(value, super.firstName, () {
      super.firstName = value;
    });
  }

  late final _$lastNameAtom =
      Atom(name: '_EmployeeEditStore.lastName', context: context);

  @override
  String get lastName {
    _$lastNameAtom.reportRead();
    return super.lastName;
  }

  @override
  set lastName(String value) {
    _$lastNameAtom.reportWrite(value, super.lastName, () {
      super.lastName = value;
    });
  }

  late final _$jobTitleAtom =
      Atom(name: '_EmployeeEditStore.jobTitle', context: context);

  @override
  String get jobTitle {
    _$jobTitleAtom.reportRead();
    return super.jobTitle;
  }

  @override
  set jobTitle(String value) {
    _$jobTitleAtom.reportWrite(value, super.jobTitle, () {
      super.jobTitle = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_EmployeeEditStore.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_EmployeeEditStore.error', context: context);

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$selectedOrgAtom =
      Atom(name: '_EmployeeEditStore.selectedOrg', context: context);

  @override
  Organization get selectedOrg {
    _$selectedOrgAtom.reportRead();
    return super.selectedOrg;
  }

  @override
  set selectedOrg(Organization value) {
    _$selectedOrgAtom.reportWrite(value, super.selectedOrg, () {
      super.selectedOrg = value;
    });
  }

  late final _$getDataAsyncAction =
      AsyncAction('_EmployeeEditStore.getData', context: context);

  @override
  Future<void> getData(Employee? emp) {
    return _$getDataAsyncAction.run(() => super.getData(emp));
  }

  late final _$getPhonesAsyncAction =
      AsyncAction('_EmployeeEditStore.getPhones', context: context);

  @override
  Future<void> getPhones(String? id) {
    return _$getPhonesAsyncAction.run(() => super.getPhones(id));
  }

  late final _$getOrganizationsAsyncAction =
      AsyncAction('_EmployeeEditStore.getOrganizations', context: context);

  @override
  Future<void> getOrganizations() {
    return _$getOrganizationsAsyncAction.run(() => super.getOrganizations());
  }

  late final _$deleteEmployeeAsyncAction =
      AsyncAction('_EmployeeEditStore.deleteEmployee', context: context);

  @override
  Future<void> deleteEmployee(Employee employee) {
    return _$deleteEmployeeAsyncAction
        .run(() => super.deleteEmployee(employee));
  }

  late final _$saveEmployeeAsyncAction =
      AsyncAction('_EmployeeEditStore.saveEmployee', context: context);

  @override
  Future<void> saveEmployee() {
    return _$saveEmployeeAsyncAction.run(() => super.saveEmployee());
  }

  late final _$_EmployeeEditStoreActionController =
      ActionController(name: '_EmployeeEditStore', context: context);

  @override
  void setOrganization(String? value) {
    final _$actionInfo = _$_EmployeeEditStoreActionController.startAction(
        name: '_EmployeeEditStore.setOrganization');
    try {
      return super.setOrganization(value);
    } finally {
      _$_EmployeeEditStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String? value) {
    final _$actionInfo = _$_EmployeeEditStoreActionController.startAction(
        name: '_EmployeeEditStore.setName');
    try {
      return super.setName(value);
    } finally {
      _$_EmployeeEditStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFirstName(String? value) {
    final _$actionInfo = _$_EmployeeEditStoreActionController.startAction(
        name: '_EmployeeEditStore.setFirstName');
    try {
      return super.setFirstName(value);
    } finally {
      _$_EmployeeEditStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLastName(String? value) {
    final _$actionInfo = _$_EmployeeEditStoreActionController.startAction(
        name: '_EmployeeEditStore.setLastName');
    try {
      return super.setLastName(value);
    } finally {
      _$_EmployeeEditStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setJobTitle(String? value) {
    final _$actionInfo = _$_EmployeeEditStoreActionController.startAction(
        name: '_EmployeeEditStore.setJobTitle');
    try {
      return super.setJobTitle(value);
    } finally {
      _$_EmployeeEditStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String? value) {
    final _$actionInfo = _$_EmployeeEditStoreActionController.startAction(
        name: '_EmployeeEditStore.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_EmployeeEditStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(Phone phone) {
    final _$actionInfo = _$_EmployeeEditStoreActionController.startAction(
        name: '_EmployeeEditStore.setPhone');
    try {
      return super.setPhone(phone);
    } finally {
      _$_EmployeeEditStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deletePhone(Phone phone) {
    final _$actionInfo = _$_EmployeeEditStoreActionController.startAction(
        name: '_EmployeeEditStore.deletePhone');
    try {
      return super.deletePhone(phone);
    } finally {
      _$_EmployeeEditStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
organizations: ${organizations},
phones: ${phones},
deletedPhones: ${deletedPhones},
id: ${id},
name: ${name},
firstName: ${firstName},
lastName: ${lastName},
jobTitle: ${jobTitle},
description: ${description},
error: ${error},
selectedOrg: ${selectedOrg}
    ''';
  }
}
