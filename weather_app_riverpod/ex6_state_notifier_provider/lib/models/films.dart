import 'package:flutter/material.dart';

@immutable
class Film{
  final String id;
  final String name;
  final String description;
  final bool isFavorite;

  const Film({
    required this.id,
    required this.name,
    required this.description,
    required this.isFavorite,
  });


  Film copyWith({
    required bool isFavorite
  }) => Film(
    id: id,
    name: name,
    description: description,
    isFavorite: isFavorite
    );

  
  @override
  String toString() => 'Film($name $description $isFavorite)';

  @override
  bool operator == (covariant Film other) => id == other.id && isFavorite == other.isFavorite;
  
  @override
  int get hashCode => Object.hashAll([id, isFavorite]);
  
}


const allFilms = [
  Film(
    id: '1',
    name: 'The ShawShank Redemption',
    description: 'ShawShank Description',
    isFavorite: false
  ),

  Film(
    id: '2',
    name: 'The Dark Knight Rises',
    description: 'The DarkKnight Rises Description',
    isFavorite: false
  ),

  Film(
    id: '3',
    name: 'The Godfather',
    description: 'The Godfather Description',
    isFavorite: false
  ),

  Film(
    id: '4',
    name: 'The Lego Movie',
    description: 'The Lego Movie Description',
    isFavorite: false
  ),

];