import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../data/models/zodiac_list_model.dart';

abstract class ZodiacRepository {
  Future<Either<Failure, ZodiacListModel>> getAllZodiac();
}
