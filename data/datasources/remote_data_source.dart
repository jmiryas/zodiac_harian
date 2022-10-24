import 'dart:convert';
import "package:http/http.dart" as http;

import '../models/zodiac_model.dart';
import '../../core/error/exceptions.dart';
import '../../core/constants/constants.dart';

abstract class RemoteDataSource {
  Future<ZodiacModel> getZodiac(String sign, String day);
}

class RemoteDataSourceImplementation implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImplementation({
    required this.client,
  });

  @override
  Future<ZodiacModel> getZodiac(String sign, String day) async {
    final zodiacApi = getAztroApi(sign, day);

    Uri zodiacUrl = Uri.parse(zodiacApi);

    final headers = {
      'Content-Type': 'application/json',
    };

    final response = await client.post(zodiacUrl, headers: headers);

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);

      return ZodiacModel.fromJson(responseJson);
    } else {
      throw ServerException();
    }
  }
}
