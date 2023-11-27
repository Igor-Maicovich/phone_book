import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:phone_book/core/models/organization.dart';
import 'package:phone_book/core/repository/drift_repository.dart';

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

  @action
  Future<void> getOrganizations() async {
    organizations = ObservableList.of(
      await DriftRepository.shared.getOrganizations(),
    );
  }

  @action
  Future<void> deleteOrganization(Organization organization) async {
    await DriftRepository.shared.deleteOrganization(organization);
  }
}
