part of 'pokemon_details_cubit.dart';

@immutable
abstract class PokemonDetailsState {}

class PokemonDetailsInitial extends PokemonDetailsState {}

class PokemonDetailsLoading extends PokemonDetailsState {}

class PokemonDetailsLoaded extends PokemonDetailsState {
  final PokemonDetails pokemonDetails;

  PokemonDetailsLoaded({required this.pokemonDetails});
}

class PokemonDetailsClear extends PokemonDetailsState {
  final PokemonListInitial pokemonListInitial;

  PokemonDetailsClear({required this.pokemonListInitial});
}

class PokemonDetailsFailed extends PokemonDetailsState {
  final Exception exception;

  PokemonDetailsFailed({required this.exception});
}
