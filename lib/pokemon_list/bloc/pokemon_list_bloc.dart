import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../data/model/pokemon_list.dart';
import '../data/repository/pokemon_list_repo.dart';

part 'pokemon_list_event.dart';
part 'pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  PokemonListBloc() : super(PokemonListInitial()) {
    final _pokemonListRepo = PokemonListRepo();

    on<PokemonListRequest>((event, emit) async {
      emit(PokemonListLoading());

      try {
        final response = await _pokemonListRepo.getPokemonList(event.pageIndex);

        emit(PokemonListLoaded(
            pokemonList: response.pokemonList,
            canLoadNextPage: response.canLoadNextPage));
      } on Exception catch (e) {
        emit(PokemonListFailed(exception: e));
      }
    });
  }
}
