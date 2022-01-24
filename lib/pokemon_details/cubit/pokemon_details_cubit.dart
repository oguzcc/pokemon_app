import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokemon_app/pokemon_list/bloc/pokemon_list_bloc.dart';
import '../data/model/pokemon_details.dart';
import '../data/model/pokemon_info_response.dart';
import '../data/model/pokemon_species_response.dart';
import '../data/repository/pokemon_details_repo.dart';

part 'pokemon_details_state.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetailsState> {
  PokemonDetailsCubit() : super(PokemonDetailsInitial());

  final _pokemonDetailsRepository = PokemonDetailsRepository();

  void getPokemonDetails(int pokemonId) async {
    emit(PokemonDetailsLoading());

    final responses = await Future.wait([
      _pokemonDetailsRepository.getPokemonInfo(pokemonId),
      _pokemonDetailsRepository.getPokemonSpeciesInfo(pokemonId),
    ]);

    final pokemonInfo = responses[0] as PokemonInfoResponse;
    final pokemonSpecies = responses[1] as PokemonSpeciesResponse;

    final pokemonDetails = PokemonDetails(
      id: pokemonInfo.id,
      name: pokemonInfo.name,
      imageUrl: pokemonInfo.imageUrl,
      types: pokemonInfo.types,
      height: pokemonInfo.height,
      weight: pokemonInfo.weight,
      description: pokemonSpecies.description,
    );

    emit(PokemonDetailsLoaded(pokemonDetails: pokemonDetails));
  }

  void clearPokemonDetails() =>
      emit(PokemonDetailsClear(pokemonListInitial: PokemonListInitial()));
}
