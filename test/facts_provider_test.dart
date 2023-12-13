import 'package:flutter_poc/models/fact_model.dart';
import 'package:flutter_poc/providers/facts_provider.dart';
import 'package:flutter_poc/services/cats_facts_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'facts_provider_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CatsFactsService>()])
void main() {
  late MockCatsFactsService mockCatsFactsService;
  late FactsProvider factsProvider;
  int listenCount = 0;

  setUp(() {
    listenCount = 0;
    mockCatsFactsService = MockCatsFactsService();
    factsProvider = FactsProvider(mockCatsFactsService)
      ..addListener(() {
        listenCount++;
      });
  });

  final expectedFact =
      Fact(fact: 'The cat was domesticated over 4,000 years ago', length: 44);

  test('should change state into success and update catFacts', () async {
    when(mockCatsFactsService.fetchCatFact())
        .thenAnswer((_) async => expectedFact);

    await factsProvider.loadFact();

    expect(factsProvider.state, equals(ResultState.success));
    expect(factsProvider.catFact, equals(expectedFact));
    expect(listenCount, equals(2));
    verify(mockCatsFactsService.fetchCatFact());
  });

  test('should change state into error', () async {
    when(mockCatsFactsService.fetchCatFact()).thenThrow(Error());

    await factsProvider.loadFact();

    expect(factsProvider.state, equals(ResultState.failed));
    expect(listenCount, equals(2));
    verify(mockCatsFactsService.fetchCatFact());
  });
}
