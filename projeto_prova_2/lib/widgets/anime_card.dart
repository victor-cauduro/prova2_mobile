import 'package:flutter/material.dart';
import '../models/anime.dart';

class AnimeCard extends StatelessWidget {
  final Anime anime;
  final Function(bool) onWatchChanged;
  final Function(String?) onLikedChanged;
  final Function onDelete;

  AnimeCard({
    required this.anime,
    required this.onWatchChanged,
    required this.onLikedChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              anime.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text("Assistido: "),
                Checkbox(
                  value: anime.watched,
                  onChanged: (value) => onWatchChanged(value!),
                ),
              ],
            ),
            if (anime.watched) ...[
              Row(
                children: [
                  Text("Gostei: "),
                  Radio<String>(
                    value: "like",
                    groupValue: anime.liked,
                    onChanged: onLikedChanged,
                  ),
                  Text("Não Gostei: "),
                  Radio<String>(
                    value: "dislike",
                    groupValue: anime.liked,
                    onChanged: onLikedChanged,
                  ),
                ],
              ),
            ],
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(Icons.delete, color: Colors.redAccent),
                onPressed: () => onDelete(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
