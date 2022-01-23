class PokemonList {
  String? name;

  String get imageUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/';

  PokemonList({required this.name});

  factory PokemonList.fromJson(Map<String, dynamic> json) => PokemonList(
        name: json['name'] as String,
      );
}

class PokemonListResponse {
  final List<PokemonList> pokemonList;
  final bool canLoadNextPage;

  PokemonListResponse(
      {required this.pokemonList, required this.canLoadNextPage});

  factory PokemonListResponse.fromJson(Map<String, dynamic> json) {
    final canLoadNextPage = json['next'] != null;
    final pokemonListings = (json['results'] as List)
        .map((pokemonListJson) => PokemonList.fromJson(pokemonListJson))
        .toList();

    return PokemonListResponse(
        pokemonList: pokemonListings, canLoadNextPage: canLoadNextPage);
  }
}
