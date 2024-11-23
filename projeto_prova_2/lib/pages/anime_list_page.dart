import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/anime.dart';
import '../widgets/anime_list.dart';
import '../widgets/anime_input.dart';

class AnimeListPage extends StatefulWidget {
  @override
  _AnimeListPageState createState() => _AnimeListPageState();
}

class _AnimeListPageState extends State<AnimeListPage> {
  late Box animeBox;

  @override
  void initState() {
    super.initState();
    animeBox = Hive.box('animeBox');
  }

  void _addAnime(Anime anime) {
    animeBox.add(anime.toMap());
  }

  void _updateAnime(int index, Anime updatedAnime) {
    animeBox.putAt(index, updatedAnime.toMap());
  }

  void _deleteAnime(int index) {
    animeBox.deleteAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Minha lista de Animes', style: TextStyle(fontSize: 22)),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Ao clicar no botão de adicionar anime
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AnimeInputPage(
                    addAnimeCallback: _addAnime,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: animeBox.listenable(),
        builder: (context, Box box, _) {
          if (box.isEmpty) {
            return Center(child: Text('Sua lista de animes está vazia.'));
          }

          return AnimeList(
            animeBox: animeBox,
            updateAnime: _updateAnime,
            deleteAnime: _deleteAnime,
          );
        },
      ),
    );
  }
}
