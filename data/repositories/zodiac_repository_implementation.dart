import 'package:dartz/dartz.dart';

import '../models/zodiac_model.dart';
import '../../core/error/failures.dart';
import '../models/zodiac_list_model.dart';
import '../../core/constants/constants.dart';
import '../../core/network/network_info.dart';
import '../datasources/remote_data_source.dart';
import '../../domain/repositories/zodiac_repository.dart';

class ZodiacRepositoryImplementation implements ZodiacRepository {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ZodiacRepositoryImplementation({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, ZodiacListModel>> getAllZodiac(
      String sign, String day) async {
    final isConnected = await networkInfo.isConnected;

    if (isConnected) {
      final Map<String, Map<String, ZodiacModel>> zodiacList = {};

      for (var sign in zodiacSignString) {
        Map<String, ZodiacModel> currentZodiac = {};

        for (var day in zodiacDayString) {
          final result = await remoteDataSource.getZodiac(sign, day);

          currentZodiac.putIfAbsent(day, () => result);
        }

        zodiacList.putIfAbsent(sign, () => currentZodiac);
      }

      final ZodiacListModel zodiacListResult = ZodiacListModel(
        zodiac: zodiacList,
      );

      return Right(zodiacListResult);
    } else {
      return Left(ServerFailure());
    }
  }
}
