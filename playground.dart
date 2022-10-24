import "package:http/http.dart" as http;

import 'core/constants/constants.dart';
import 'data/models/zodiac_model.dart';
import 'data/datasources/remote_data_source.dart';

void main() async {
  RemoteDataSourceImplementation dataSourceImplementation =
      RemoteDataSourceImplementation(client: http.Client());

  final Map<String, Map<String, ZodiacModel>> zodiacList = {};

  for (var sign in zodiacSignString) {
    Map<String, ZodiacModel> currentZodiac = {};

    for (var day in zodiacDayString) {
      final result = await dataSourceImplementation.getZodiac(sign, day);

      currentZodiac.putIfAbsent(day, () => result);
    }

    zodiacList.putIfAbsent(sign, () => currentZodiac);
  }
}
