part of 'pokemon_list_bloc.dart';

@immutable
abstract class PokemonListState {}

class PokemonListInitial extends PokemonListState {}

class PokemonListLoading extends PokemonListState {}

class PokemonListLoaded extends PokemonListState {
  final List<PokemonList> pokemonList;
  final bool canLoadNextPage;

  PokemonListLoaded({
    required this.pokemonList,
    required this.canLoadNextPage,
  });
}

class PokemonListFailed extends PokemonListState {
  final Exception exception;

  PokemonListFailed({required this.exception});
}
