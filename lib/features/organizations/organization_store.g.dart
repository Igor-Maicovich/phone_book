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

  late final _$loadingAtom =
      Atom(name: '_OrganizationStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$_changeLoadingAsyncAction =
      AsyncAction('_OrganizationStore._changeLoading', context: context);

  @override
  Future<void> _changeLoading(bool value) {
    return _$_changeLoadingAsyncAction.run(() => super._changeLoading(value));
  }

  late final _$getOrganizationsAsyncAction =
      AsyncAction('_OrganizationStore.getOrganizations', context: context);

  @override
  Future<void> getOrganizations() {
    return _$getOrganizationsAsyncAction.run(() => super.getOrganizations());
  }

  late final _$pullDataBaseAsyncAction =
      AsyncAction('_OrganizationStore.pullDataBase', context: context);

  @override
  Future<void> pullDataBase() {
    return _$pullDataBaseAsyncAction.run(() => super.pullDataBase());
  }

  @override
  String toString() {
    return '''
organizations: ${organizations},
loading: ${loading}
    ''';
  }
}
