import 'package:business_code_by_mohamed_salah/features/home/data/repositories/home_repository_impl.dart';
import 'package:business_code_by_mohamed_salah/features/home/domain/repositories/home_repository.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/use_cases/auth_usecase.dart';
import '../../features/home/domain/usecase/home_use_case.dart';
import 'localization_service.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  //Shared dependencies
  sl.registerLazySingleton(() => LocalizationService());
  //auth dependencies
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  sl.registerLazySingleton(() => SignOutUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => SignInUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => SignUpUseCase(sl<AuthRepository>()));
  //Home dependencies
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl());
  sl.registerLazySingleton(() => GetBusinessCardUseCase(sl<HomeRepository>()));
  sl.registerLazySingleton(() => SaveBusinessCardUseCase(sl<HomeRepository>()));
  sl.registerLazySingleton(() => DeleteBusinessCardUseCase(sl<HomeRepository>()));
}
