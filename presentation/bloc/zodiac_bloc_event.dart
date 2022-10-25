part of 'zodiac_bloc.dart';

abstract class ZodiacBlocEvent extends Equatable {
  const ZodiacBlocEvent();

  @override
  List<Object> get props => [];
}

class GetAllZodiacEvent extends ZodiacBlocEvent {}
