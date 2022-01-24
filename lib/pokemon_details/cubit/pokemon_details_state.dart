part of 'pokemon_details_cubit.dart';

@immutable
abstract class PokemonDetailsState {}

class PokemonDetailsInitial extends PokemonDetailsState {}

class PokemonDetailsLoaded extends PokemonDetailsState {
  final PokemonDetails pokemonDetails;

  PokemonDetailsLoaded({required this.pokemonDetails});
}

class PokemonDetailsSuccess extends PokemonDetailsState {}

class PokemonDetailsClear extends PokemonDetailsState {}
