import 'package:flutter/material.dart';
import 'package:rickandmorty_app/views/home/widgets/characters.dart';
import 'package:rickandmorty_app/views/home/widgets/footer.dart';
import 'package:rickandmorty_app/views/home/widgets/hedaer.dart';
import 'package:rickandmorty_app/views/home/widgets/princial.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(23, 23, 23, 1),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
        
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(48),
                  child: HeaderWidget(),
                ),
                Padding(
                  padding: const EdgeInsets.all(48),
                  child: PrincialCharactersWidget(),
                ),
                Padding(
                  padding: const EdgeInsets.all(48),
                  child: CharactersWidget(),
                ),
                FooterWidget()
        
              ],
            ),
          ),
        ),
      ),
    );
  }
}
