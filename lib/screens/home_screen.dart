import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repaso_movies_app/providers/pokemon_provider.dart';
import 'package:repaso_movies_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokemonsProvider=Provider.of<PokemonProvider>(context);
    print(pokemonsProvider.onDisplayPokemons);

    return Scaffold(
      appBar: AppBar(
        title: const Text('101 POKEMONS'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed:(){}, 
            icon: const Icon(Icons.search_rounded),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children:  [
            CardSwiper(pokemons: pokemonsProvider.onDisplayPokemons,),
            MovieSlider(pokemons: pokemonsProvider.onDisplayPokemons,),
          ],
        ),
      )
    );
  }
}