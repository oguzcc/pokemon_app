class PokemonSpeciesResponse {
  final String description;

  PokemonSpeciesResponse({required this.description});

  factory PokemonSpeciesResponse.fromJson(Map<String, dynamic> json) {
    return PokemonSpeciesResponse(
      description: json['flavor_text_entries'][0]['flavor_text'],
    );
  }
}
