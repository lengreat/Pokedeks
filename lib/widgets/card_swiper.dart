import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:repaso_movies_app/models/models.dart';

class CardSwiper extends StatelessWidget {
  final List<PokemonEntry> pokemons;
  const CardSwiper({ 
    Key? key, 
    required this.pokemons 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;

    if (pokemons.isEmpty){//segmento necesario cuando aun no hay imagenes hasta que se carguen
      return  Container(
        width: double.infinity,
        height: size.height*0.55,
        color: Colors.red,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: size.height * 0.55,
      color: Colors.red,
      child: Swiper(
        itemCount: pokemons.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width*0.5,
        itemHeight: size.height*0.6,
        itemBuilder: (_, int index){
          final pokemon=pokemons[index];//no funciona si el itemcount no esta definido
          final idPokemon=pokemon.entryNumber;
          final namePokemon=pokemon.pokemonSpecies.name;
          print(namePokemon);
          print(idPokemon);
          // generacion de ruta-------------
          int numImagen=0;
          String rutaImagen='';
          String indice=(index+1).toString();
          //print(indice);
          rutaImagen=generacionDeRuta(index, indice);
          
        

          return GestureDetector(
            onTap: ()=>Navigator.pushNamed(context, 'details', arguments: 'cualquier cosa'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:  Column(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeInImage(
                    placeholder: const AssetImage('assets/no-image.jpg'),
                    //image: NetworkImage('https://via.placeholder.com/300x400'),
                    image: AssetImage(rutaImagen),
                    fit: BoxFit.cover,
                   ),
                   const SizedBox(height: 5,),
                   
                   Text(
                    namePokemon,
                    //overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline4,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    ),
                ],
              ),
            ),
          );
          
        },
        ),
    );
  }

  String generacionDeRuta(int index, String indice) {
    String rutaImagen;
     if ((index+1)<10){
              rutaImagen='assets/pokemons/00'+indice+'.png';
             print(rutaImagen);}
           else{
             if((index+1)>10 && (index+1)<100){
              rutaImagen='assets/pokemons/0' +indice+'.png';
              print(rutaImagen);}
              
              else
              if ((index+1)>=100 && (index+1)<152){
                rutaImagen='assets/pokemons/' +indice+'.png';
                print(rutaImagen);
              }
              else
                 rutaImagen='assets/no-image.jpg';
           }
           return rutaImagen;
  }
}