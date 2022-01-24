import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../pokemon_details/nav_cubit.dart';
import '../../app/constants/strings.dart';
import '../../components/loading_view.dart';
import '../bloc/pokemon_list_bloc.dart';

class PokemonListPage extends StatelessWidget {
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PokemonListView();
  }
}

class PokemonListView extends StatelessWidget {
  const PokemonListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(pokemonPageTitle),
      ),
      body: BlocBuilder<PokemonListBloc, PokemonListState>(
        builder: (context, state) {
          if (state is PokemonListLoading) {
            return const LoadingView();
          } else if (state is PokemonListLoaded) {
            return GridView.builder(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemCount: state.pokemonList.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => context
                    .read<NavCubit>()
                    .showPokemonDetails(state.pokemonList[index].id),
                child: Card(
                  color: index % 2 == 0 ? Colors.red[50] : Colors.blue[50],
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Positioned(
                        top: 8,
                        child: Image.network(
                          state.pokemonList[index].imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 8,
                        child: Text(
                          state.pokemonList[index].name,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is PokemonListFailed) {
            return Center(
              child: Text(state.exception.toString()),
            );
          } else {
            return const Center(
              child: Text('Something Wrong'),
            );
          }
        },
      ),
    );
  }
}
