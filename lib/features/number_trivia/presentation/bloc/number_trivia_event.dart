import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class NumberTriviaEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetTriviaForConcreteNumber extends NumberTriviaEvent {
  final String numberString;

  GetTriviaForConcreteNumber(this.numberString);

  @override
  List<Object> get props => [numberString];
}

class GetTriviaForRandomNumber extends NumberTriviaEvent {}

class GetTriviaYearNumber extends NumberTriviaEvent {
  final String numberString;

  GetTriviaYearNumber(this.numberString);

  @override
  List<Object> get props => [numberString];
}