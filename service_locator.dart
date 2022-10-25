import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/network/network_info.dart';
import 'presentation/bloc/zodiac_bloc.dart';
import 'domain/usecases/get_all_zodiac.dart';
import 'data/datasources/remote_data_source.dart';
import 'domain/repositories/zodiac_repository.dart';
import 'data/repositories/zodiac_repository_implementation.dart';

final serviceLocator = GetIt.instance;

Future<void> initializeServiceLocator() async {
  // Bloc

  serviceLocator.registerFactory(
    () => ZodiacBloc(
      getAllZodiacUseCase: serviceLocator(),
    ),
  );

  // Get books by query

  serviceLocator.registerLazySingleton(
    () => GetAllZodiacUseCase(
      zodiacRepository: serviceLocator(),
    ),
  );

  // Gutendex repository

  serviceLocator.registerLazySingleton<ZodiacRepository>(
    () => ZodiacRepositoryImplementation(
      remoteDataSource: serviceLocator(),
      networkInfo: serviceLocator(),
    ),
  );

  // Remote dan network info

  serviceLocator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImplementation(
      client: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImplementation(
      dataConnectionChecker: serviceLocator(),
    ),
  );

  // Client dan data connection checker

  serviceLocator.registerLazySingleton(() => http.Client());
  serviceLocator.registerLazySingleton(() => InternetConnectionChecker());
}
