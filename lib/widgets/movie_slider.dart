import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 195,
      color: Colors.red[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Populares', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
          ),
          Expanded(//Define tamano al hijo
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 15,
              // itemBuilder: (BuildContext context, int index){
              //   return _MoviePoster();
              // }
              itemBuilder: (_, int index)=>const _MoviePoster(),
            ),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 117,
      height: 130,
      color: Colors.red[200],
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: ()=>Navigator.pushNamed(context, 'details', arguments: 'lo q sea'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
               placeholder: AssetImage('assets/no-image.jpg'),
               image: NetworkImage('https://via.placeholder.com/300x400'),
               width: 117,
               height: 130,
               fit: BoxFit.fill,
               ),
            ),
          ),
           Text(
            'Safkns fsf sfsk sf sk fs fks sk sfsfsfsand sssd s ',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
           )
        ],
      ),
    );
  }
}