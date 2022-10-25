import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../repositories/zodiac_repository.dart';
import '../../data/models/zodiac_list_model.dart';

class GetAllZodiacUseCase implements UseCase<ZodiacListModel, NoParams> {
  final ZodiacRepository zodiacRepository;

  GetAllZodiacUseCase({
    required this.zodiacRepository,
  });

  @override
  Future<Either<Failure, ZodiacListModel>> call(params) async {
    return await zodiacRepository.getAllZodiac();
  }
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object> get props => [];
}
