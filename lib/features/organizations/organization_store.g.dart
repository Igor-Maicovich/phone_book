// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrganizationStore on _OrganizationStore, Store {
  late final _$organizationsAtom =
      Atom(name: '_OrganizationStore.organizations', context: context);

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

  late final _$getOrganizationsAsyncAction =
      AsyncAction('_OrganizationStore.getOrganizations', context: context);

  @override
  Future<void> getOrganizations() {
    return _$getOrganizationsAsyncAction.run(() => super.getOrganizations());
  }

  late final _$deleteOrganizationAsyncAction =
      AsyncAction('_OrganizationStore.deleteOrganization', context: context);

  @override
  Future<void> deleteOrganization(Organization organization) {
    return _$deleteOrganizationAsyncAction
        .run(() => super.deleteOrganization(organization));
  }

  @override
  String toString() {
    return '''
organizations: ${organizations}
    ''';
  }
}
