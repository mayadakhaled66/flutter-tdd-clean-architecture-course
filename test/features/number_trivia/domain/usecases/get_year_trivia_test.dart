import 'package:clean_architecture_tdd_course/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/domain/usecases/get_number_of_year_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockYearTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetNumberOfYearTrivia usecase;
  MockYearTriviaRepository mockYearTriviaRepository;

  setUp(() {
    mockYearTriviaRepository = MockYearTriviaRepository();
    usecase = GetNumberOfYearTrivia(mockYearTriviaRepository);
  });

  final tNumber = 2000;
  final tNumberTrivia = NumberTrivia(number: 2000, text: 'test');

  test(
    'should get trivia for the number from the repository',
    () async {
      // arrange
      when(mockYearTriviaRepository.getNumberOfYearTrivia(any))
          .thenAnswer((_) async => Right(tNumberTrivia));
      // act
      final result = await usecase(Parameters(number: tNumber));
      // assert
      expect(result, Right(tNumberTrivia));
      verify(mockYearTriviaRepository.getNumberOfYearTrivia(tNumber));
      verifyNoMoreInteractions(mockYearTriviaRepository);
    },
  );
}
