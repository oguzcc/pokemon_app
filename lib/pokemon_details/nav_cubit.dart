import 'package:flutter_bloc/flutter_bloc.dart';
import '../pokemon_list/bloc/pokemon_list_bloc.dart';

import 'cubit/pokemon_details_cubit.dart';

class NavCubit extends Cubit<PokemonDetailsState> {
  PokemonDetailsCubit pokemonDetailsCubit;

  NavCubit({required this.pokemonDetailsCubit})
      : super(PokemonDetailsInitial());

  void showPokemonDetails(int pokemonId) {
    pokemonDetailsCubit.getPokemonDetails(pokemonId);
    emit(PokemonDetailsLoading());
  }

  void popToPokemonList() {
    pokemonDetailsCubit.clearPokemonDetails();
    emit(PokemonDetailsClear(pokemonListInitial: PokemonListInitial()));
  }
}
