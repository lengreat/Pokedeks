import 'package:flutter/material.dart';
import 'package:repaso_movies_app/widgets/casting_cards.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //obteniedno el argumento de la ruta desde donde se llamo este widget
    final String movie=ModalRoute.of(context)?.settings.arguments.toString()??'no-movie';
    return  Scaffold(
      body: CustomScrollView(
        slivers: [
           const _CustomAppbar(),
          SliverList(
            delegate: SliverChildListDelegate(
            [
              const _PosterAndTitle(),
              const _Overview(),
              const _Overview(),
              const _Overview(),
              const _Overview(),
              CastingCards(),
            ]
          ))
        ],
      ),
    );
  }
}
class _Overview extends StatelessWidget {
  const _Overview({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const  EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child:  Text(' Tempor enim tempor tempor fugiat Lorem duis nostrud sint anim.sdsNostrud magna id reprehenderit minim enim aute voluptate aliquip occaecat nisi velit ea nisi.',
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.subtitle1,)
      
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme= Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding:const  EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child:  const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage('https://via.placeholder.com/200x300'),
                height: 150,
                width: 100,
            ),
          ),
          const SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('titulo', style: textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2,),
              Text('original de la peli', style: textTheme.subtitle2, overflow: TextOverflow.ellipsis, maxLines: 2,),
              Row(
                children: [
                  const Icon(Icons.star_border_purple500, size: 15, color:  Colors.green,),
                  const SizedBox(width: 5,),
                  Text('rate', style: Theme.of(context).textTheme.caption,)
                ],
              )            
            ],
          )
        ],
      ),
    );
  }
}

class _CustomAppbar extends StatelessWidget {
  const _CustomAppbar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),//quitamos el pading q lleva por defecto
        title: Container(
          padding: EdgeInsets.only(bottom: 5),
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: const Text(
            'titulo de pelicula',
            style: TextStyle(fontSize: 14),
          ),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'), 
          image: NetworkImage('https://via.placeholder.com/200x300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}