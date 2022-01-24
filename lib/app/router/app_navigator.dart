import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/pokemon_details/cubit/pokemon_details_cubit.dart';
import 'package:pokemon_app/pokemon_details/nav_cubit.dart';
import 'package:pokemon_app/pokemon_details/view/pokemon_details_page.dart';
import 'package:pokemon_app/pokemon_list/view/pokemon_list_page.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, PokemonDetailsState>(
        builder: (context, state) {
      return Navigator(
        pages: [
          const MaterialPage(child: PokemonListPage()),
          if (state is PokemonDetailsLoaded || state is PokemonDetailsLoading)
            const MaterialPage(child: PokemonDetailsPage())
        ],
        onPopPage: (route, result) {
          context.read<NavCubit>().popToPokemonList();
          return route.didPop(result);
        },
      );
    });
  }
}
