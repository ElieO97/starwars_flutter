import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:marquee/marquee.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:star_wars_flutter/ui/model/movie_view_model.dart';

class MovieDetailsContentWidget extends StatelessWidget {
  const MovieDetailsContentWidget(this.movie);

  final MovieViewModel movie;

  List<String> _supportedWidgets() {
    return <String>['title', 'characters', 'plot'];
  }

  @override
  Widget build(BuildContext context) {
    final List<ListItem> items = List<ListItem>.generate(
      _supportedWidgets().length,
      (int position) {
        switch (_supportedWidgets()[position]) {
          case 'title':
            return HeaderItem();
          case 'characters':
            return CharactersItem();
          case 'plot':
            return PlotItem();
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

        return ListTile(title: item.buildItem(context, movie));
      },
    );
  }
}

abstract class ListItem {
  Widget buildItem(BuildContext context, MovieViewModel movie);
}

class HeaderItem implements ListItem {
  @override
  Widget buildItem(BuildContext context, MovieViewModel movie) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: const EdgeInsets.only(bottom: 5.0, top: 20.0),
            child: Text(movie.title,
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.bold))),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(movie.releaseDate),
            SmoothStarRating(
                allowHalfRating: false,
                starCount: 5,
                rating: (movie.imdbRating ?? 0.0) / 2.0,
                size: 20.0,
                isReadOnly: true,
                color: Theme.of(context).accentColor,
                borderColor: Theme.of(context).accentColor,
                spacing: 0.0)
          ],
        )
      ],
    );
  }
}

class CharactersItem implements ListItem {
  @override
  Widget buildItem(BuildContext context, MovieViewModel movie) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(AppLocalizations.of(context)!.characters.toUpperCase(),
            style:
                const TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5.0),
        Text(movie.characters.join(', '))
      ],
    );
  }
}

class PlotItem implements ListItem {
  @override
  Widget buildItem(BuildContext context, MovieViewModel movie) {
    final Container container = Container(
        height: 400,
        child: Marquee(
            text: movie.plot,
            scrollAxis: Axis.vertical,
            style: const TextStyle(fontWeight: FontWeight.bold)));
    if (kIsWeb) {
      return container;
    } else {
      return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.007)
            ..rotateX(-0.2),
          alignment: FractionalOffset.center,
          child: container);
    }
  }
}
