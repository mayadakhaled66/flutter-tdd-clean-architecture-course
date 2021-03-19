
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/number_trivia.dart';
import '../repositories/number_trivia_repository.dart';

class GetNumberOfYearTrivia implements UseCase<NumberTrivia, Parameters> {
  final NumberTriviaRepository repository;

  GetNumberOfYearTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(Parameters params) async {
    return await repository.getNumberOfYearTrivia(params.number);
  }
}

class Parameters extends Equatable {
  final int number;

  Parameters({@required this.number});

  @override
  List<Object> get props => [number];
}
