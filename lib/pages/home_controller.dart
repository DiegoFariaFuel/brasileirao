import 'package:brasileirao/modelo/time.dart';
//import '../modelo/titulo.dart';
import '../repositories/times_repository.dart';

class HomeController {

  late TimesRepository timesRepository;

  List<Time> get tabela => timesRepository.times;

  HomeController() {

  timesRepository = TimesRepository();
  }
}
