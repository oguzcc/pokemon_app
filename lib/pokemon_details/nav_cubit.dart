import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/pokemon_details_cubit.dart';

class NavCubit extends Cubit<PokemonDetailsState> {
  PokemonDetailsCubit pokemonDetailsCubit;

  NavCubit({required this.pokemonDetailsCubit})
      : super(PokemonDetailsInitial());

  void showPokemonDetails(int pokemonId) {
    emit(PokemonDetailsSuccess());
    pokemonDetailsCubit.getPokemonDetails(pokemonId);
  }

  void popToPokemonList() {
    // emit(PokemonDetailsClear());
    pokemonDetailsCubit.clearPokemonDetails();
  }
}
