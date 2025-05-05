import 'package:flutter/material.dart';
import 'package:rickandmorty_app/utils/constants.dart';

class CardCharacterWidget extends StatefulWidget {
  const CardCharacterWidget({super.key});

  @override
  State<CardCharacterWidget> createState() => _CardCharacterWidgetState();
}

class _CardCharacterWidgetState extends State<CardCharacterWidget> {
  List<String> list = <String>['English', 'Español'];

  int bgIndex = 0;
  List<String> backgrownds = ['bg1.png', 'bg2.png', 'bg3.jpg'];
  late String actualBackgrownd;


  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = list.first;
    actualBackgrownd = backgrownds[bgIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 800,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              image: AssetImage('lib/assets/$actualBackgrownd'),
              fit: BoxFit.cover,
            ),
          ),
        ),

        Positioned(
          left: 0,
          top: 0,
          child: Container(
            width: 300,
            height: 110,
            decoration: BoxDecoration(
              color: ColorConstants.darkColor,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(25)),
            ),
            child: Center(
              child: Image.asset('lib/assets/RickaAndMortylogo.png'),
            ),
          ),
        ),

        Positioned(
          left: 330,
          top: 20,
          child: Container(
            width: 350,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Colors.white, 
                width: 2,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 70,
                    height: 36,
                    child: TextButton(
                      style: 
                      bgIndex == 0?
                        ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(Colors.white),
                        )
                      :
                      ButtonStyle(
                        foregroundColor: WidgetStateProperty.all(Colors.white),
                      ),
                      onPressed: () {
                         setState(() {
                          bgIndex = 0;
                          actualBackgrownd = backgrownds[bgIndex];
                        });
                      },
                      child: Text('Home', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 100,
                    height: 36,
                    child: TextButton(
                      style: bgIndex == 1?
                        ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(Colors.white),
                          foregroundColor: WidgetStateProperty.all(Colors.black),
                        )
                      :
                      ButtonStyle(
                        foregroundColor: WidgetStateProperty.all(Colors.white),
                      ),
                      onPressed: () {
                        setState(() {
                          bgIndex = 1;
                          actualBackgrownd = backgrownds[bgIndex];
                        });
                      },
                      child: Text(
                        'About Us',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 120,
                    height: 36,
                    child: TextButton(
                      style:bgIndex == 2?
                        ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(Colors.white),
                          foregroundColor: WidgetStateProperty.all(Colors.black),
                        )
                      :
                      ButtonStyle(
                        foregroundColor: WidgetStateProperty.all(Colors.white),
                      ),
                      onPressed: () {
                         setState(() {
                          bgIndex = 2;
                          actualBackgrownd = backgrownds[bgIndex];
                        });
                      },
                      child: Text(
                        'Contact Us',
                        style: TextStyle(fontSize: 16,),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        Positioned(
          right: 0,
          top: 0,
          child: Container(
            width: 400,
            height: 110,
            decoration: BoxDecoration(
              color: ColorConstants.darkColor,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 120,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.transparent, 
                    border: Border.all(
                      color: Colors.white, 
                      width: 2, 
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Colors.white,
                      ),
                      elevation: 16,
                      style: const TextStyle(color: Colors.white),
                      underline: Container(
                        height: 2,
                        color: Colors.transparent,
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      items:
                          list.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                    ),
                  ),
                ),

                Padding(padding: EdgeInsets.only(left: 20)),

                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                      side: const BorderSide(color: Colors.white, width: 2),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 36,
                    ),
                  ),
                  child: const Text('Log Out', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
