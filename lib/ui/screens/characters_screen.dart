import 'package:breaking_bad_series/business_logic/bloc/cubit/characters_cubit.dart';
import 'package:breaking_bad_series/constants/my_colors.dart';
import 'package:breaking_bad_series/data/models/character_model.dart';
import 'package:breaking_bad_series/ui/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allCharacters;
  late List<Character> searchForCharacters = [];
  bool _isSearching = false;

  final _searchTextController = TextEditingController();

  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: MyColors.myGrey,
      decoration: const InputDecoration(
        hintStyle: TextStyle(
          color: MyColors.myGrey,
          fontSize: 18.0,
        ),
        border: InputBorder.none,
        hintText: 'Find a Character...',
      ),
      style: const TextStyle(
        color: MyColors.myGrey,
        fontSize: 18.0,
      ),
      onChanged: ( searchForCharacters) {
        addSearchedForItemsToSearchedList(searchForCharacters);
      },
    );
  }
//this method for search
  void addSearchedForItemsToSearchedList(String  searchForCharacter) {

    setState(() {
      searchForCharacters = allCharacters.
      where((character) =>
          character.name.toLowerCase().contains(searchForCharacter)).toList();
    });
  }
  

  List<Widget>_buildAppBarActions (){
    if(_isSearching){
      return [
        IconButton(onPressed: (){
          _clearSearch();
          Navigator.pop(context);
        }, icon:const Icon(Icons.clear,color: MyColors.myGrey,),)
      ];
    }else{
      return [
        IconButton(onPressed:
          _startSearch
        , icon: const Icon(Icons.search,color: MyColors.myGrey,),),
      ];
    }

  }
  void _startSearch(){
    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching),);
    setState(() {
      _isSearching = true;
    });
  }
  void _stopSearching(){
    _clearSearch();
    setState(() {
      _isSearching =false;
    });
  }
  void _clearSearch(){
    setState(() {
      _searchTextController.clear();
    });
  }

  Widget _buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, states) {
      if (states is CharactersLoaded) {
        allCharacters = (states).character;
        return _buildLoadedListWidget();
      } else {
        return _showLoadingIndicator();
      }
    });
  }

  Widget _showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }

  Widget _buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [
            _buildCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget _buildCharactersList() {
    return GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        //this for search
        itemCount: _searchTextController.text.isEmpty ? allCharacters.length : searchForCharacters.length,
        physics: const ClampingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
        ),
        itemBuilder: (
          ctx,
          index,
        ) {
          return CharacterItem(
            character:_searchTextController.text.isEmpty ? allCharacters[index] : searchForCharacters[index],
          );
        });
  }

  Widget _buildAppBarTitle(){
    return const Text(
      'Character',
      style: TextStyle(color: MyColors.myGrey),
    );
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: _isSearching ? _buildSearchField() : _buildAppBarTitle() ,
        actions: _buildAppBarActions(),
        leading: _isSearching ? const BackButton(color: MyColors.myGrey,): Container(),
      ),
      body: _buildBlocWidget(),
    );
  }
}
