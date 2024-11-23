import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/anime.dart';
import 'anime_card.dart';

class AnimeList extends StatelessWidget {
  final Box animeBox;
  final Function(int, Anime) updateAnime;
  final Function(int) deleteAnime;

  AnimeList({
    required this.animeBox,
    required this.updateAnime,
    required this.deleteAnime,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: animeBox.length,
      itemBuilder: (context, index) {
        var animeMap = animeBox.getAt(index);

        // Convertendo o Map para o tipo correto (Map<String, dynamic>)
        if (animeMap is Map<String, dynamic>) {
          Anime anime = Anime.fromMap(animeMap);

          return AnimeCard(
            anime: anime,
            onWatchChanged: (value) {
              anime.watched = value;
              updateAnime(index, anime);
            },
            onLikedChanged: (value) {
              anime.liked = value!;
              updateAnime(index, anime);
            },
            onDelete: () => deleteAnime(index),
          );
        } else {
          return SizedBox(); // Caso o valor não seja um Map<String, dynamic>, retornar um widget vazio
        }
      },
    );
  }
}
