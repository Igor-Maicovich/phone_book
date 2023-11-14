import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:phone_book/app.dart';
import 'package:phone_book/features/employees/employee_store.dart';
import 'package:phone_book/features/organizations/organization_store.dart';
import 'package:phone_book/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await _configureInjection();
  runApp(const App());
}

Future<void> _configureInjection() async {
  GetIt.I.registerSingletonAsync<OrganizationStore>(
    OrganizationStore().init() as FactoryFuncAsync<OrganizationStore>,
  );
  GetIt.I.registerSingletonAsync<EmployeeStore>(
    EmployeeStore().init() as FactoryFuncAsync<EmployeeStore>,
  );
  return;
}
