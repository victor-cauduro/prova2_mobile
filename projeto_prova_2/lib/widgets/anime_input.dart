import 'package:flutter/material.dart';
import '../models/anime.dart';

class AnimeInputPage extends StatefulWidget {
  final Function(Anime) addAnimeCallback;

  AnimeInputPage({required this.addAnimeCallback});

  @override
  _AnimeInputPageState createState() => _AnimeInputPageState();
}

class _AnimeInputPageState extends State<AnimeInputPage> {
  final _controller = TextEditingController();
  bool _watched = false;
  String _liked = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Anime'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Nome do Anime',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text("Assistido: "),
                Checkbox(
                  value: _watched,
                  onChanged: (bool? value) {
                    setState(() {
                      _watched = value!;
                    });
                  },
                ),
              ],
            ),
            if (_watched) ...[
              Row(
                children: [
                  Text("Gostei: "),
                  Radio<String>(
                    value: "like",
                    groupValue: _liked,
                    onChanged: (value) {
                      setState(() {
                        _liked = value!;
                      });
                    },
                  ),
                  Text("Não Gostei: "),
                  Radio<String>(
                    value: "dislike",
                    groupValue: _liked,
                    onChanged: (value) {
                      setState(() {
                        _liked = value!;
                      });
                    },
                  ),
                ],
              ),
            ],
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  final anime = Anime(
                    name: _controller.text,
                    watched: _watched,
                    liked: _liked,
                  );
                  widget.addAnimeCallback(anime);
                  Navigator.pop(context);
                }
              },
              child: Text('Adicionar Anime'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
