import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../app/constants/strings.dart';
import '../model/pokemon_list.dart';

class PokemonRepo {
  final client = http.Client();
  final String innerPath = '/api/v2/pokemon';

  Future<PokemonListResponse> getPokemonList(int pageIndex) async {
    final queryParameters = {
      'limit': '882',
      'offset': (pageIndex * 100).toString(),
    };

    final uri = Uri.https(baseUrl, innerPath, queryParameters);

    final response = await client.get(uri);
    final json = jsonDecode(response.body);

    return PokemonListResponse.fromJson(json);
  }
}
