import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:phone_book/core/models/organization.dart';
import 'package:phone_book/core/services/drift_service.dart';

part 'organization_store.g.dart';

class OrganizationStore extends _OrganizationStore with _$OrganizationStore {
  static OrganizationStore get shared => GetIt.I.get<OrganizationStore>();

  OrganizationStore init() {
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
      await DriftService().selectOrganizations(),
    );
  }
}
