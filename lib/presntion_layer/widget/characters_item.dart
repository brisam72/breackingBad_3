import 'package:bloc_breacking_3/constans/strings.dart';
import 'package:bloc_breacking_3/data_layer/models/character.dart';
import 'package:flutter/material.dart';

class ChatactersItem extends StatelessWidget {
  final Character character;
  const ChatactersItem({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: Colors.amber[200], borderRadius: BorderRadius.circular(8.5)),
      child: InkWell(
        onTap: ()=> Navigator.pushNamed(context, charactersDetailsScreen,arguments: character),
        child: GridTile(
          child: Hero(
            tag: character.charId,
            child: Container(
              color: Colors.blue[50],
              child: character.imag.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: 'assets/images/load.gif',
                      image: character.imag,
                      fit: BoxFit.cover)
                  : Image.asset('assets/images/person.png'),
            ),
          ),
          footer: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              '${character.name}',
              style: TextStyle(height: 1.3, color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            
            ),
          ),
        ),
      ),
    );
  }
}
