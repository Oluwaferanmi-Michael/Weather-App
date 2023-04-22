import 'package:ex6_state_notifier_provider/models/films.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FilmsNotifier extends StateNotifier<List<Film>> {
  FilmsNotifier() : super(allFilms);


  void update(Film film, bool isFavorite){
    state = state.map((thisFilm) => thisFilm.id == film.id ? thisFilm.copyWith(isFavorite: isFavorite) : thisFilm).toList();
  }
  
}

final allFilmsProvider = StateNotifierProvider<FilmsNotifier, List<Film>>((ref) => FilmsNotifier());