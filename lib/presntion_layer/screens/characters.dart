import 'package:bloc_breacking_3/business_logic_layer/cubit/characters_cubit.dart';
import 'package:bloc_breacking_3/data_layer/models/character.dart';
import 'package:bloc_breacking_3/presntion_layer/widget/characters_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreens extends StatefulWidget {
  const CharactersScreens({Key? key}) : super(key: key);

  @override
  _CharactersScreensState createState() => _CharactersScreensState();
}

class _CharactersScreensState extends State<CharactersScreens> {
  List<Character> allCharacters = [];

  late List<Character> searchedForCharacters;

  bool _isSearching = false;

  final _isSearchingTextController = TextEditingController();

  Widget _buildSearchField() {
    return TextField(
      controller: TextEditingController(),
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        hintText: 'Find Character',
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 18,
        ),
      ),
      style: TextStyle(
        color: Colors.grey,
        fontSize: 18,
      ),
      onChanged: (searchedCharacter) {
        addSerachedForItemsSearchedList(searchedCharacter);
      },
    );
  }

  void addSerachedForItemsSearchedList(String searchedCharacter) {
    searchedForCharacters = allCharacters
        .where((character) =>
            character.name.toLowerCase().startsWith(searchedCharacter))
        .toList();

    //Todo
    setState(() {
     
    });
  }

  List<Widget> _buildAppBarAction() {
    if (_isSearching) {
      return [
        IconButton(
            onPressed: () {
              _clearSearching();
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.clear,
              color: Colors.grey,
            ))
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: Icon(Icons.search),
          color: Colors.grey,
        )
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearching();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearching() {
    setState(() {
      _isSearchingTextController.clear();
    });
  }

  Widget _buildAppBarTitle() {
    return Center(child: Text('Character'));
  }

  Widget showLoadingIndecitor() {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.yellow,
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    BlocProvider.of<CharactersCubit>(context).getallcharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: _isSearching
            ? BackButton(
                color: Colors.grey,
              )
            : Container(),
        title: _isSearching ? _buildSearchField() : _buildAppBarTitle(),
        actions: _buildAppBarAction(),
      ),
      body: buildBlocWidget(),
    );
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
      if (state is CharactersLoaded) {
        allCharacters = state.characters;
        return buildLoadedWidget();
      } else {
        return showLoadingIndecitor();
      }
    });
  } // end buildBlocWidget

  Widget buildLoadedWidget() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey,
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1),
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: _isSearchingTextController.text.isEmpty
            ? allCharacters.length
            : searchedForCharacters.length,
        itemBuilder: (context, index) {
          return ChatactersItem(
            character: _isSearchingTextController.text.isEmpty
                ? allCharacters[index]
                : searchedForCharacters[index],
          );
        });
  }
}


//end class  _CharactersScreensState
