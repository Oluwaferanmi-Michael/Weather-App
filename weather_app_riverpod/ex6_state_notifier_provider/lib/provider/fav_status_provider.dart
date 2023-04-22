import 'package:ex6_state_notifier_provider/ext.dart';
import 'package:ex6_state_notifier_provider/provider/state_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/films.dart'; 
 
 final favStatusProvider = StateProvider((_)
  => FavoriteStatus.allFilms
 );


 final favFilmProvider = Provider<Iterable<Film>>((ref) => ref.watch(allFilmsProvider).where((element) => element.isFavorite));

 final notFavFilmProvider = Provider<Iterable<Film>>((ref) => ref.watch(allFilmsProvider).where((film) => !film.isFavorite));