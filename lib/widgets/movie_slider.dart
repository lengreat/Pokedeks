import 'package:flutter/material.dart';
import 'package:repaso_movies_app/models/models.dart';

class MovieSlider extends StatelessWidget {
  final List<PokemonEntry> pokemons;
  const MovieSlider({ 
    Key? key, 
    required this.pokemons }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 225,
      color: Colors.white12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Lista de Pokemones ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
          ),
          Expanded(//Define tamano al hijo
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: pokemons.length,
              // itemBuilder: (BuildContext context, int index){
              //   return _MoviePoster();
              // }
              itemBuilder: (_, int index){
                 return  _MoviePoster(pokemons: pokemons, id: index,);
              }
            ),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final List<PokemonEntry> pokemons;
  final int id;
  const _MoviePoster({ 
    Key? key, 
    required this.pokemons, 
    required this.id }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokemon=pokemons[id];//no funciona si el itemcount no esta definido
    final idPokemon=pokemon.entryNumber;
    final namePokemon=pokemon.pokemonSpecies.name;
    print(namePokemon);
    print(idPokemon);

    // generacion de ruta-------------
    int numImagen=0;
    String rutaImagen='';
    String indice=(id+1).toString();
    //print(indice);
    rutaImagen=generacionDeRuta(id, indice);
    return Container(
      width: 117,
      height: 150,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: ()=>Navigator.pushNamed(context, 'details', arguments: 'lo q sea'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
               placeholder: const AssetImage('assets/no-image.jpg'),
               image: AssetImage(rutaImagen),
               width: 117,
               height: 155,
               fit: BoxFit.fill,
               ),
            ),
          ),
          const SizedBox(height: 5,),
            Text(
            namePokemon,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
           )
        ],
      ),
    );
  }

  String generacionDeRuta(int id, String indice) {
      String rutaImagen;
     if ((id+1)<10){
              rutaImagen='assets/pokemons/00'+indice+'.png';
             print(rutaImagen);}
           else{
             if((id+1)>10 && (id+1)<100){
              rutaImagen='assets/pokemons/0' +indice+'.png';
              print(rutaImagen);}
              
              else
              if ((id+1)>=100 && (id+1)<152){
                rutaImagen='assets/pokemons/' +indice+'.png';
                print(rutaImagen);
              }
              else
                 rutaImagen='assets/no-image.jpg';
           }
           return rutaImagen;
  }
}