import 'package:flutter/material.dart';
import 'package:star_wars_flutter/generated/l10n.dart';
import 'package:star_wars_flutter/models/movie.dart';
import 'package:star_wars_flutter/navigation/star_wars_router.dart';


class MovieSummaryWidget extends StatelessWidget {
  const MovieSummaryWidget({this.movie});

  final Movie movie;

  Widget _buildSummaryWidget(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(movie.title, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15.0)),
          Text(movie.releaseDate, style:  const TextStyle(fontSize: 12.0, color: Colors.grey,)),
          const SizedBox(height: 20),
          Container(height:1.0, width:200.0, color: Colors.grey,),
          const SizedBox(height: 20),
          Text(S.of(context).director, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12.0)),
          const SizedBox(height: 5.0),
          Text(movie.director, style: const TextStyle(color: Colors.black, fontSize: 12.0)),
          const SizedBox(height: 20),
          Text(S.of(context).producers, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12.0)),
          const SizedBox(height: 5.0),
          Text(movie.producer, style: const TextStyle(color: Colors.black, fontSize: 12.0)),
        ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Card (
        color: Colors.white,
        elevation: 8.0,
        child: InkWell (
            onTap: () => goToMovieDetailsScreen(context, movie),
            child: Row (
                children: <Widget>[
                  Container (
                    width: 200,
                    child:  AspectRatio(
                      aspectRatio: 1 / 1,
                      child:  Image(
                        image: AssetImage(movie.getImagePath()),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

              Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _buildSummaryWidget(context)
                ),
              ),
                ]
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }
}


