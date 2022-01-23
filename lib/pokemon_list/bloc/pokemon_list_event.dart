part of 'pokemon_list_bloc.dart';

@immutable
abstract class PokemonListEvent {}

class PokemonListRequest extends PokemonListEvent {
  final int pageIndex;

  PokemonListRequest({required this.pageIndex});
}
