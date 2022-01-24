import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../app/constants/strings.dart';
import '../model/pokemon_species_response.dart';
import '../model/pokemon_info_response.dart';

class PokemonDetailsRepository {
  final client = http.Client();

  Future<PokemonInfoResponse> getPokemonInfo(int pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon/$pokemonId');

    final response = await client.get(uri);
    final json = jsonDecode(response.body);
    return PokemonInfoResponse.fromJson(json);
  }

  Future<PokemonSpeciesResponse> getPokemonSpeciesInfo(int pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon-species/$pokemonId');

    final response = await client.get(uri);
    final json = jsonDecode(response.body);
    return PokemonSpeciesResponse.fromJson(json);
  }
}
