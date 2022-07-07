import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:repaso_movies_app/models/models.dart';

class PokemonProvider extends ChangeNotifier{
  String _apiKey='';
  String _baseURL='pokeapi.co';
  String _languaje='';

  List<PokemonEntry> onDisplayPokemons=[];

  PokemonProvider(){
    print('PokemonProvider incializado');
    getOnDisplayPokemons();
  }

  void getOnDisplayPokemons() async {
    // ignore: avoid_print
    var url=Uri.https(_baseURL, '/api/v2/pokedex/2/', {
    });
    final response=await http.get(url);
    print(response.body);//respuesta en string
    final Map<String, dynamic> decodeData=json.decode(response.body);
    print(decodeData['pokemon_entries'][0]['pokemon_species']);//respuesta mapeada

    final pokedexsResponse=PokemonEntries.fromJson(response.body);
    print(pokedexsResponse.pokemonEntries[0].pokemonSpecies.name);
    onDisplayPokemons=pokedexsResponse.pokemonEntries;//guardo la lista de pokemones
    print(onDisplayPokemons[0].entryNumber);
    notifyListeners();

  }
}