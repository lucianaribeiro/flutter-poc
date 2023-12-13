import 'package:flutter_poc/models/fact_model.dart';
import 'package:flutter_poc/services/cats_facts_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'cats_facts_service_test.mocks.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
void main() {
  late MockClient mockClient;
  late CatsFactsService catsFactsService;

  setUp(() {
    mockClient = MockClient();
    catsFactsService = CatsFactsService(mockClient);
  });

  final uri = Uri.parse('https://catfact.ninja/fact');
  const jsonString = """
  {   "status": "ok",
      "fact": "The cat was domesticated over 4,000 years ago",
      "length": 44
  }
  """;

  final expectedFact =
      Fact(fact: 'The cat was domesticated over 4,000 years ago', length: 44);

  test('should return a cat fact with success when status code is 200',
      () async {
    when(mockClient.get(uri))
        .thenAnswer((_) async => http.Response(jsonString, 200));

    final result = await catsFactsService.fetchCatFact();

    expect(result, equals(expectedFact));
    verify(mockClient.get(uri));
    mockClient.close();
  });

  test('should throw an error when status code is not 200', () async {
    when(mockClient.get(uri)).thenAnswer((_) async => http.Response('', 404));

    final call = catsFactsService.fetchCatFact();

    expect(() => call, throwsA(isA<Error>()));
    verify(mockClient.get(uri));
    mockClient.close();
  });
}
