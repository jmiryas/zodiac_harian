import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../../data/models/zodiac_list_model.dart';

class GetAllZodiacUseCase implements UseCase<ZodiacListModel, Params> {
  @override
  Future<Either<Failure, ZodiacListModel>> call(params) {
    throw UnimplementedError();
  }
}

class Params extends Equatable {
  final String sign;
  final String day;

  const Params({
    required this.sign,
    required this.day,
  });

  @override
  List<Object> get props => [sign, day];
}
