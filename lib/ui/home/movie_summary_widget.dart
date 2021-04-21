import 'package:flutter/material.dart';
import 'package:star_wars_flutter/ui/mapper/movie_mapper.dart';
import 'package:star_wars_flutter/generated/l10n.dart';
import 'package:star_wars_flutter/ui/model/movie_view_model.dart';
import 'package:star_wars_flutter/ui/router/star_wars_router.dart';

class MovieSummaryWidget extends StatelessWidget {
  const MovieSummaryWidget({required this.movie, required this.mapper});

  final MovieViewModel movie;
  final MovieMapper mapper;

  Widget _buildSummaryWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(movie.title,
            style:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
        Text(movie.releaseDate,
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.grey,
            )),
        const SizedBox(height: 20),
        Container(
          height: 1.0,
          width: 200.0,
          color: Colors.grey,
        ),
        const SizedBox(height: 20),
        Text(S.of(context).director,
            style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 12.0)),
        const SizedBox(height: 5.0),
        Text(movie.director, style: const TextStyle(fontSize: 12.0)),
        const SizedBox(height: 20),
        Text(S.of(context).producers,
            style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 12.0)),
        const SizedBox(height: 5.0),
        Text(movie.producer, style: const TextStyle(fontSize: 12.0)),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Card(
        elevation: 8.0,
        child: InkWell(
            onTap: () =>
                goToMovieDetailsScreen(context, mapper.mapToView(movie)),
            child: Row(children: <Widget>[
              Container(
                width: 150,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image(
                    image: AssetImage(movie.getImagePath() ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _buildSummaryWidget(context)),
              ),
            ])));
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }
}
