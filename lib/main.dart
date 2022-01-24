import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/router/app_navigator.dart';
import 'pokemon_details/cubit/pokemon_details_cubit.dart';
import 'pokemon_details/nav_cubit.dart';
import 'pokemon_list/bloc/pokemon_list_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokemonDetailsCubit = PokemonDetailsCubit();
    return MaterialApp(
      theme: Theme.of(context).copyWith(primaryColor: Colors.red),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  PokemonListBloc()..add(PokemonListRequest(pageIndex: 0))),
          BlocProvider(
              create: (context) =>
                  NavCubit(pokemonDetailsCubit: pokemonDetailsCubit)),
          BlocProvider(create: (context) => pokemonDetailsCubit)
        ],
        child: const AppNavigator(),
      ),
    );
  }
}
