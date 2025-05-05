import 'package:flutter/material.dart';
import 'package:rickandmorty_app/models/character.dart';
import 'package:rickandmorty_app/services/api_character.dart';
import 'package:rickandmorty_app/services/api_filter.dart';
import 'package:rickandmorty_app/widgets/separator.dart';

class CharactersWidget extends StatefulWidget {
  const CharactersWidget({super.key});

  @override
  State<CharactersWidget> createState() => _CharactersWidgettState();
}

class _CharactersWidgettState extends State<CharactersWidget> {
  late List<Character>? _characters = [];
  int currentPage = 1;
  late int totalPages;
  late int nextPage;
  late int previusPage;
   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
String dropdownValue1 = 'Opción 1';
String dropdownValue2 = 'Opción A';
TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _getCharacters(currentPage);
  }

  void _getCharacters(int page) async {
    final characters = await ApiRickAndMorty().getCharacters(page);
   
    if (characters != null && characters.results.isNotEmpty) {
      setState(() {
        totalPages = characters.info.pages;
        previusPage =  characters.info.prev != null? characters.info.pages : 0;
        nextPage = (currentPage + 6) < totalPages? currentPage + 6 : currentPage+(totalPages - currentPage -1);
      });
      
    } else {
    }

    setState(() {
      _characters = characters!.results;
    });
  }


 void _getFilterCharacters(String name) async {
    final characters = await ApiFilterCharacter().getCharacters(name);
   
    if (characters != null && characters.results.isNotEmpty) {
      setState(() {
        totalPages = characters.info.pages;
        previusPage =  characters.info.prev != null? characters.info.pages : 0;
        nextPage = (currentPage + 6) < totalPages? currentPage + 6 : currentPage+(totalPages - currentPage -1);
      });
      
    } else {
      print('No se pudo obtener información de los personajes');
    }

    setState(() {
      _characters = characters!.results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 72),
      child: Column(
        children: [
          
          SizedBox(
            height: 60,
            child: Form(
              key: formKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Row(
                    children: [
                     Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: DropdownButton<String>(
                          value: dropdownValue1,
                          dropdownColor: Colors.black, // Fondo del menú desplegable (opcional)
                          iconEnabledColor: Colors.white, // Color del icono flecha
                          underline: SizedBox(), // Quitamos la línea por defecto
                          style: TextStyle(color: Colors.white), // Color del texto seleccionado
                          items: ['Opción 1', 'Opción 2', 'Opción 3']
                              .map((value) => DropdownMenuItem(
                                    value: value,
                                    child: Text(value, style: TextStyle(color: Colors.white)),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              dropdownValue1 = value!;
                            });
                          },
                        ),
                      ),



                      SizedBox(width: 8),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: DropdownButton<String>(
                          value: dropdownValue2,
                          dropdownColor: Colors.black, // Fondo del menú desplegable (opcional)
                          iconEnabledColor: Colors.white, // Color del icono flecha
                          underline: SizedBox(), // Quitamos la línea por defecto
                          style: TextStyle(color: Colors.white), // Color del texto seleccionado
                          items: ['Opción A', 'Opción B', 'Opción C']
                              .map((value) => DropdownMenuItem(
                                    value: value,
                                    child: Text(value, style: TextStyle(color: Colors.white)),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              dropdownValue2 = value!;
                            });
                          },
                        ),
                      )
                    ],
                  ),

                  Spacer(),

                  Row(
                    children: [
                      SizedBox(
                        width: 300,
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          onTap: (){
                             setState(() {
                            _getFilterCharacters(searchController.text);
                          });
                          },
                          controller: searchController,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.search, color: Colors.white54),
                            hintStyle: TextStyle(color: Colors.white54),
                            hintText: 'Buscar...',
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),

                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.white), // color del borde normal
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.white, width: 2), // color del borde enfocado
                            ),
    
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                ],
              ),
            ),
          ),


          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 80,
              mainAxisSpacing: 40,
              crossAxisCount: 3, 
              mainAxisExtent: 600, 
            ),
            itemCount: _characters!.length,
            itemBuilder: (context, index) {
              final character = _characters![index];
              return Padding(
                padding: const EdgeInsets.all(8.0), 
                child: Column(
                  children: [
                    Row(
                      children: [
                      Expanded(
                        flex: 2, 
                        child: Container(
                          margin:  EdgeInsets.only(top: 28,left: 18),
                          width: 20,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.white, width: 2),
                            ),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(40),
                            ),
                          ),
                          child: Text('/  ${character.id}', style: TextStyle(color: Colors.white),),
                        ),
                      ),
                      Expanded(
                        flex: 8, 
                        child: Container(
                          margin: EdgeInsets.only(top: 12),
                          width: double.maxFinite - 80,
                          height: 46,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(color: Colors.white, width: 2),
                              right: BorderSide(color: Colors.white, width: 2),
                            ),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.white, width: 2),
                          right: BorderSide(color: Colors.white, width: 2),
                          left: BorderSide(color: Colors.white, width: 2),
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          SeparatorWidget(size: 12),
                          SizedBox(
                            width: double.infinity,
                            height: 400,
                            child: Image.network(
                              character.image,
                              fit: BoxFit.cover,
                              errorBuilder:
                                  (context, error, stackTrace) => Icon(Icons.error),
                            ),
                          ),
                          SeparatorWidget(size: 16),
                          Text(
                            character.name,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 32, color: Colors.white),
                          ),                          
                          SeparatorWidget(size: 16),

                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          Container(
            height: 35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: 
                        currentPage > 1?
                      BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(8) )
                      : BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child:  currentPage > 1?
                      InkWell(
                        onTap: (){
                          
                          setState(() {
                            currentPage = 1 ;
                            _getCharacters(currentPage);
                          });
                        },
                        child: Text(
                          "<<",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                      :
                      Text(
                          "<<",
                          style: TextStyle(color: Colors.grey)
                    ),
                  ) 
                ),
                
                Padding(
                  padding: const EdgeInsets.only(left: 20 , right: 20),
                  child: SizedBox(
                    height: 35,
                    width: 220,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child:
                           Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: InkWell(
                              onTap: (){
                                setState(() {
                                  currentPage = currentPage + index ;
                                  _getCharacters(currentPage);
                                });
                              },
                              child: Text(
                                "${currentPage + index}",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: 
                        currentPage < totalPages?
                      BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(8) )
                      : BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child:  currentPage < totalPages?
                      InkWell(
                        onTap: (){
                          
                          setState(() {
                            currentPage = totalPages ;
                            _getCharacters(currentPage);
                          });
                        },
                        child: Text(
                          ">>",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                      :
                      Text(
                          ">>",
                          style: TextStyle(color: Colors.grey)
                    ),
                  ) 
                ),


              ],
            ),
          )
                    

        ],
      ),
    );
  }
  
}
