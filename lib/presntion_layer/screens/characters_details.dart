import 'package:flutter/material.dart';

import 'package:bloc_breacking_3/data_layer/models/character.dart';

class CharactersDetailsScreen extends StatelessWidget {
  final Character character;
  const CharactersDetailsScreen({
    Key? key,
    required this.character,
  }) : super(key: key);

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(children: [
        TextSpan(
          text: title,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        TextSpan(
          text: value,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ]),
    );
  }

  Widget buildDivaider(double endIndent) {
    return Divider(
      color: Colors.yellow,
      endIndent:endIndent ,
      height: 40,
      thickness: 3,
    );
  }

  Widget buildSiversAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.grey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.nikName,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        background: Hero(
          tag: character.charId,
          child: Image.network(character.imag, fit: BoxFit.cover),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: CustomScrollView(
        slivers: [
          buildSiversAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo('job :',character.jobs.join(' / ')),
                      buildDivaider(315),
                      characterInfo('Appeared in :',character.category),
                      buildDivaider(250),
                      characterInfo('Sesesion:',character.appearance.join(' / ')),
                      buildDivaider(250),
                      characterInfo('Status:',character.status),
                      buildDivaider(250),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
