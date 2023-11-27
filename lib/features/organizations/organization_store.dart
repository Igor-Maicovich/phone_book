import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:phone_book/core/models/organization.dart';
import 'package:phone_book/core/repository/drift_repository.dart';
import 'package:phone_book/core/repository/firebase_repository.dart';

part 'organization_store.g.dart';

class OrganizationStore extends _OrganizationStore with _$OrganizationStore {
  static OrganizationStore get shared => GetIt.I.get<OrganizationStore>();

  Future<OrganizationStore> init() async {
    getOrganizations();
    return this;
  }
}

abstract class _OrganizationStore with Store {
  @observable
  ObservableList<Organization> organizations = ObservableList<Organization>();

  @observable
  bool loading = false;

  @action
  Future<void> _changeLoading(bool value) async {
    loading = value;
  }

  @action
  Future<void> getOrganizations() async {
    _changeLoading(true);
    organizations = ObservableList.of(
      await DriftRepository.shared.getOrganizations(),
    );
    _changeLoading(false);
  }

  @action
  Future<void> pullDataBase() async {
    _changeLoading(true);
    final orgs = await FirebaseRepository.shared.getAllOrganizations();
    final emps = await FirebaseRepository.shared.getAllEmployees();
    final phones = await FirebaseRepository.shared.getAllPhones();
    await DriftRepository.shared.pullDataBase(
      orgs: orgs,
      emps: emps,
      phones: phones,
    );
    organizations = ObservableList.of(
      await DriftRepository.shared.getOrganizations(),
    );
    _changeLoading(false);
  }
}
