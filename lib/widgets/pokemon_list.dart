import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_app/widgets/pokelist_item.dart';

import '../model/pokemon_model.dart';
import '../services/pokedex_api.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> _pokemonListFuture;

  @override
  void initState() {
    super.initState();
    _pokemonListFuture = PokeApi.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: _pokemonListFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PokemonModel> _Listem = snapshot.data!;

          return GridView.builder(
            itemCount: _Listem.length,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: ScreenUtil().orientation==Orientation.portrait ? 2 : 3 ),
              itemBuilder: (context, index) =>
                  PokeListItem(pokemon: _Listem[index]));
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("hata geldi"),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
