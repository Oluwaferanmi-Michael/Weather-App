import 'package:ex6_state_notifier_provider/ext.dart';
import 'package:ex6_state_notifier_provider/models/films.dart';
import 'package:ex6_state_notifier_provider/provider/state_notifier.dart';
import 'package:ex6_state_notifier_provider/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/fav_status_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Films'),),
      body: Column(
        children: [
          const FilterWidget(),
          Consumer(builder: (context, ref, child) {
            final filter = ref.watch(favStatusProvider);
            switch (filter) {
              case FavoriteStatus.allFilms:
                return FilmList(provider: allFilmsProvider);
              case FavoriteStatus.favorite:
                return FilmList(provider: favFilmProvider);
              case FavoriteStatus.notFavorite:
                return FilmList(provider: notFavFilmProvider);
              default:
                return FilmList(provider: allFilmsProvider);
            }
            })
        ],
      ),);
  }
}



class FilmList extends ConsumerWidget {
  final AlwaysAliveProviderBase<Iterable<Film>> provider;
  const FilmList({super.key,  required this.provider,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   final films = ref.watch(provider);
    return Expanded(
      child: ListView.builder(
        itemCount: films.length,
        itemBuilder: (context, index) {
          final film = films.elementAt(index);
          final favoriteIcon = film.isFavorite ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border);

          return ListTile(
            title: Text(film.name),
            subtitle: Text(film.description),
            trailing: IconButton(icon: favoriteIcon,
            onPressed: () {
              final isFavorite = !film.isFavorite;
              ref.read(allFilmsProvider.notifier).update(film, isFavorite);
              })
          );
        }
      )
    );
  }
}