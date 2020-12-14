import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:star_wars_flutter/generated/l10n.dart';
import 'package:star_wars_flutter/models/movie.dart';

class MovieDetailsContentWidget extends StatelessWidget {

  const MovieDetailsContentWidget(this.movie);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final List<ListItem> items = List<ListItem>.generate(
      movie.supportedWidgets().length,
          (int position) {
            switch(movie.supportedWidgets()[position]) {
              case 'title':
                return HeaderItem();
                break;
              case 'characters':
                return CharactersItem();
                break;
              case 'plot':
                return PlotItem();
                break;

              default:
                return HeaderItem();
            }
            },

    );
    

    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => const Divider(
        color: Colors.grey,
      ),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final ListItem item = items[index];

        return ListTile(
          title: item.buildItem(context, movie)
        );
      },
    );
  }

  Widget buildDirectorName() {
    if (movie.director.isEmpty) {
      return Container();
    }
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('directed by ${movie.director}',
              style: const TextStyle(fontSize: 13.0)),
        ),
      ],
    );
  }
}


abstract class ListItem {
  Widget buildItem(BuildContext context, Movie movie);
}

class HeaderItem implements ListItem {
  @override
  Widget buildItem(BuildContext context, Movie movie) {
    return Column(
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start ,
       children: <Widget>[
         Container(
             margin: const EdgeInsets.only(bottom: 5.0, top: 20.0),
             child: Text(movie.title, style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold))),
         Row(
           children: <Widget>[
             Text(movie.releaseDate)
           ],
         )
       ],
    );

  }
}

class CharactersItem implements ListItem {
  @override
  Widget buildItem(BuildContext context, Movie movie) {
    return Material(
        elevation: 20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start ,
          children: <Widget>[
            Container(
                margin: const EdgeInsets.only(bottom: 5.0, top: 15.0),
                child: Text(S().characters.toUpperCase(), style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold))),
            Text(/*movie.character.join(', ')*/'')
          ],
    ));
  }
}

class PlotItem implements ListItem {
  @override
  Widget buildItem(BuildContext context, Movie movie) {
    return Text(movie.plot);
  }
}

