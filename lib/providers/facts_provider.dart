import 'package:flutter/foundation.dart';
import 'package:flutter_poc/models/fact_model.dart';
import 'package:flutter_poc/services/cats_facts_service.dart';

enum ResultState { success, failed, loading }

class FactsProvider extends ChangeNotifier {
  final CatsFactsService catsFactsService;

  late Fact catFact;

  ResultState state = ResultState.loading;

  FactsProvider(this.catsFactsService);

  Future loadFact() async {
    state = ResultState.loading;
    notifyListeners();
    try {
      catFact = await catsFactsService.fetchCatFact();
      state = ResultState.success;
    } catch (error) {
      state = ResultState.failed;
    }

    notifyListeners();
  }
}
