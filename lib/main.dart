import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:phone_book/app.dart';
import 'package:phone_book/core/models/drift_database.dart';
import 'package:phone_book/core/repository/drift_repository.dart';
import 'package:phone_book/core/repository/firebase_repository.dart';
import 'package:phone_book/features/employees/employee_store.dart';
import 'package:phone_book/features/organizations/organization_store.dart';
import 'package:phone_book/firebase_options.dart';

import 'features/edit_employee/edit_employee_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await _configureInjection();
  runApp(const App());
}

Future<void> _configureInjection() async {
  GetIt.I.registerSingleton<AppDatabase>(AppDatabase());
  GetIt.I.registerSingleton<DriftRepository>(DriftRepository());
  GetIt.I.registerSingleton<FirebaseRepository>(FirebaseRepository());
  GetIt.I.registerSingletonAsync<OrganizationStore>(
    OrganizationStore().init,
  );
  GetIt.I.registerSingletonAsync<EmployeeStore>(
    EmployeeStore().init,
  );
  GetIt.I.registerSingletonAsync<EmployeeEditStore>(
    EmployeeEditStore().init,
  );
  return;
}
