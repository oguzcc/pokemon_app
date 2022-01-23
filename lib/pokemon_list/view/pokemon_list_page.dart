import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app/constants/strings.dart';
import '../../components/loading_view.dart';
import '../bloc/pokemon_list_bloc.dart';

class PokemonListPage extends StatelessWidget {
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PokemonListBloc()..add(PokemonListRequest(pageIndex: 0)),
      child: const PokemonListView(),
    );
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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemCount: state.pokemonList.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.all(4),
                child: Card(
                  color: Colors.red[50],
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Positioned(
                        top: 20,
                        child: Text(
                          '${index + 1}',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Positioned(
                        top: 30,
                        child: Image.network(
                          state.pokemonList[index].imageUrl +
                              '${index + 1}.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        child: Text(
                          state.pokemonList[index].name.toString(),
                          style: Theme.of(context).textTheme.headline6,
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
