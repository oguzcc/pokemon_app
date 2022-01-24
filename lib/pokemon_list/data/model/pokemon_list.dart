class PokemonList {
  final String name;
  final int id;

  PokemonList({required this.name, required this.id});

  String get imageUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

  factory PokemonList.fromJson(Map<String, dynamic> json) => PokemonList(
        name: json['name'] as String,
        id: int.parse((json['url'] as String).split('/')[6]),
      );
}

class PokemonListResponse {
  final List<PokemonList> pokemonList;
  final bool canLoadNextPage;

  PokemonListResponse(
      {required this.pokemonList, required this.canLoadNextPage});

  factory PokemonListResponse.fromJson(Map<String, dynamic> json) {
    final canLoadNextPage = json['next'] != false;
    final pokemonList = (json['results'] as List)
        .map((pokemonListJson) => PokemonList.fromJson(pokemonListJson))
        .toList();

    return PokemonListResponse(
        pokemonList: pokemonList, canLoadNextPage: canLoadNextPage);
  }
}
