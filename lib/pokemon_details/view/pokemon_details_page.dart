import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/loading_view.dart';
import '../../app/constants/colors.dart';
import '../cubit/pokemon_details_cubit.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PokemonDetailsView();
  }
}

class PokemonDetailsView extends StatelessWidget {
  const PokemonDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textStyle6 = Theme.of(context).textTheme.headline6;
    return BlocBuilder<PokemonDetailsCubit, PokemonDetailsState>(
      builder: (context, state) {
        if (state is PokemonDetailsLoading) {
          return const LoadingView();
        } else if (state is PokemonDetailsLoaded) {
          return Scaffold(
              appBar: AppBar(
                title: Text(state.pokemonDetails.name.toUpperCase()),
              ),
              body: Center(
                child: Column(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: state.pokemonDetails.id % 2 == 0
                              ? Colors.blue[50]
                              : Colors.red[50],
                          elevation: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.network(
                                state.pokemonDetails.imageUrl,
                                fit: BoxFit.cover,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: state.pokemonDetails.types
                                    .map((type) => pokemonTypeView(type))
                                    .toList(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 24),
                                child: Text(
                                  'id: ${state.pokemonDetails.id}\nWeight: ${state.pokemonDetails.weight}\nHeight: ${state.pokemonDetails.height}',
                                  textAlign: TextAlign.center,
                                  style: _textStyle6,
                                ),
                              ),
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: SizedBox(
                          width: double.infinity,
                          child: Card(
                            color: state.pokemonDetails.id % 2 == 0
                                ? Colors.red[50]
                                : Colors.blue[50],
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(32),
                              child: Text(
                                state.pokemonDetails.description,
                                textAlign: TextAlign.center,
                                style: _textStyle6,
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ));
        } else if (state is PokemonDetailsFailed) {
          return Center(child: Text('${state.exception}'));
        } else {
          return Container();
        }
      },
    );
  }
}
