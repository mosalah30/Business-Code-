import 'package:get_it/get_it.dart';

import 'localization_service.dart';


final sl = GetIt.instance;

Future<void> setupLocator() async {
 //Shared dependencies
  sl.registerLazySingleton(() => LocalizationService());


  //auth
  // sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl());
  // sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl<AuthRemoteDataSource>()));
  // sl.registerLazySingleton(() => GetTokenUseCase(sl<AuthRepository>()));
  // sl.registerLazySingleton(() => GetPrivacyAndTermsUseCase(sl<AuthRepository>()));
  // sl.registerLazySingleton(() => GetStatesUseCase(sl<AuthRepository>()));
  // sl.registerLazySingleton(() => GetCitiesUseCase(sl<AuthRepository>()));
  // sl.registerLazySingleton(() => LoginUseCase(sl<AuthRepository>()));
  //

}
