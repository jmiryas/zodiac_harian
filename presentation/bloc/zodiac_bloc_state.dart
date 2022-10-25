part of 'zodiac_bloc.dart';

abstract class ZodiacBlocState extends Equatable {
  const ZodiacBlocState();

  @override
  List<Object> get props => [];
}

class ZodiacBlocInitialState extends ZodiacBlocState {}

class ZodiacBlocLoadingState extends ZodiacBlocState {}

class ZodiacBlocLoadedState extends ZodiacBlocState {
  final ZodiacListModel zodiacList;

  const ZodiacBlocLoadedState({
    required this.zodiacList,
  });

  @override
  List<Object> get props => [zodiacList];
}

class ZodiacBlocErrorState extends ZodiacBlocState {
  final String errorMessage;

  const ZodiacBlocErrorState({
    required this.errorMessage,
  });

  @override
  List<Object> get props => [errorMessage];
}
