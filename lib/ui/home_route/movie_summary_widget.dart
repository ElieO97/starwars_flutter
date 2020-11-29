


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_wars_flutter/generated/l10n.dart';
import 'package:star_wars_flutter/models/movie.dart';
import 'package:star_wars_flutter/navigation/star_wars_router.dart';



class MovieSummaryWidget extends StatelessWidget {

  final Movie movie;

  MovieSummaryWidget({this.movie});

  @override
  Widget build(BuildContext context) {
    return _buildListMovieSummaryWidget(context);
  }


  Widget _buildListMovieSummaryWidget(BuildContext context) {
    return Card (
        elevation: 8.0,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),

       child: InkWell (
         onTap: () {
           goToMovieDetailsScreen(context, movie);
         },

         child:  Row(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget>[
           Image(image: AssetImage(movie.getImagePath()), height: 180,),
           Flexible(child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(movie.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
                   Text(movie.releaseDate, style:  const TextStyle(fontSize: 12.0)),
                   Padding (
                     padding: const EdgeInsets.only(left: 0.0, top: 20.0),
                     child:  Container(height:1.0, width:200.0, color: Colors.grey,),
                   ),

                   Padding (
                     padding: const EdgeInsets.only(left: 0.0, top: 20.0),
                     child:  Text(S.of(context).director, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12.0)),
                   ),
                   Padding (
                     padding: const EdgeInsets.only(left: 0.0, top: 5.0),
                     child:  Text(movie.director, style: const TextStyle(fontSize: 12.0)),
                   ),

                   Padding (
                     padding: const EdgeInsets.only(left: 0.0, top: 20.0),
                     child:  Text(S.of(context).producers, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12.0)),
                   ),


                  Padding (
                     padding: const EdgeInsets.only(left: 0.0, top: 5.0),
                     child: Text(movie.producer, style: const TextStyle(fontSize: 12.0)),
                   )
                 ],
               )
           ),),

         ],
       ),

       )
    );
  }

}


