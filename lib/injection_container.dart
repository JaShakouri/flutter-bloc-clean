import 'package:get_it/get_it.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:supplier_drivers/bloc/pages/splash/splash_cubit.dart';
import 'package:supplier_drivers/domain/config/constant_config.dart';
import 'package:supplier_drivers/domain/core/network/network_info.dart';

final getIT = GetIt.instance;

Future<void> init() async {

  /**
   * ! Features
   */
  // Bloc
  getIT.registerFactory<SplashCubit>(
    () => SplashCubit(),
  );

  // // Use Case
  // sl.registerLazySingleton(() => GetTopHeadlinesNews(newsRepository: sl()));
  // sl.registerLazySingleton(() => SearchTopHeadlinesNews(newsRepository: sl()));
  //
  // // Repository
  // sl.registerLazySingleton<NewsRepository>(
  //     () => NewsRepositoryImpl(newsRemoteDataSource: sl(), networkInfo: sl()));
  //
  // // Data Source
  // sl.registerLazySingleton<NewsRemoteDataSource>(
  //     () => NewsRemoteDataSourceImpl(dio: sl(), constantConfig: sl()));

  /**
   * ! Core
   */
  getIT.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIT()));

  /**
   * ! External
   */
  // sl.registerLazySingleton(() {
  //   return DioApiService();
  // });
  getIT.registerLazySingleton(() => ConstantConfig());
  getIT.registerLazySingleton(() => DataConnectionChecker());
}