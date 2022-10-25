import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/failures.dart';
import '../../core/constants/constants.dart';
import '../../data/models/zodiac_list_model.dart';
import '../../domain/usecases/get_all_zodiac.dart';

part 'zodiac_bloc_event.dart';
part 'zodiac_bloc_state.dart';

class ZodiacBloc extends Bloc<ZodiacBlocEvent, ZodiacBlocState> {
  final GetAllZodiacUseCase getAllZodiacUseCase;

  ZodiacBloc({
    required this.getAllZodiacUseCase,
  }) : super(ZodiacBlocInitialState()) {
    on<GetAllZodiacEvent>(_getAllZodiacHandler);
  }

  void _getAllZodiacHandler(
    GetAllZodiacEvent event,
    Emitter<ZodiacBlocState> emit,
  ) async {
    final getAllZodiacEither = await getAllZodiacUseCase(const NoParams());

    await getAllZodiacEither.fold(
      (failure) async => emit(
        ZodiacBlocErrorState(
          errorMessage: _mapFailureToMessage(failure),
        ),
      ),
      (zodiacList) async => emit(
        ZodiacBlocLoadedState(zodiacList: zodiacList),
      ),
    );
  }

  // Map error message.

  String _mapFailureToMessage(Failure failure) {
    late final String failureMessage;

    switch (failure.runtimeType) {
      case ServerFailure:
        failureMessage = serverFailureMessage;
        break;
      default:
        failureMessage = "Unexpected error";
        break;
    }

    return failureMessage;
  }
}
